import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/helpers/guest_guard.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/listing_details/cubit/listing_details_cubit.dart';
import 'package:gaza_tech/features/listing_details/cubit/listing_details_state.dart';
import 'package:gaza_tech/features/listing_details/data/models/listing_detail_model.dart';
import 'package:gaza_tech/core/widgets/delete_confirmation_sheet.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/listing_details_body.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/listing_details_error_view.dart';
import 'package:gaza_tech/features/report/data/models/report_reason.dart';
import 'package:gaza_tech/features/report/ui/widgets/report_bottom_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListingDetailsScreen extends StatefulWidget {
  const ListingDetailsScreen({super.key});

  @override
  State<ListingDetailsScreen> createState() => _ListingDetailsScreenState();
}

class _ListingDetailsScreenState extends State<ListingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListingDetailsCubit, ListingDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (message) => ListingDetailsErrorView(message: message),
            success:
                (
                  listing,
                  similarListings,
                  sellerListings,
                  isBookmarked,
                  isReported,
                ) => ListingDetailsBody(
                  listing: listing,
                  similarListings: similarListings,
                  sellerListings: sellerListings,
                  isBookmarked: isBookmarked,
                  sliverAppBar: _buildSliverAppBar(
                    context,
                    listing,
                    isBookmarked,
                    isReported,
                  ),
                ),
          );
        },
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(
    BuildContext context,
    ListingDetailModel listing,
    bool isBookmarked,
    bool isReported,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final currentUserId = Supabase.instance.client.auth.currentUser?.id;
    final isOwner = listing.sellerId == currentUserId;

    return SliverAppBar(
      expandedHeight: screenHeight / 1.8,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Back button
          _buildCircularIconButton(
            icon: Icons.arrow_back,
            onPressed: () => context.pop(),
          ),
          const Spacer(),
          // Bookmark, Share, Edit, Delete, Report buttons
          _buildCircularIconButton(
            icon: isBookmarked
                ? Icons.bookmark_rounded
                : Icons.bookmark_border_rounded,
            onPressed: () async {
              if (!await GuestGuard.requireAccount(context)) return;
              if (!context.mounted) return;
              context.read<ListingDetailsCubit>().toggleBookmark();
            },
          ),
          const HorizontalSpace(4),
          _buildCircularIconButton(icon: Icons.share_rounded, onPressed: () {}),
          const HorizontalSpace(4),
          if (isOwner) ...[
            _buildCircularIconButton(
              icon: Icons.edit_rounded,
              onPressed: () => _navigateToEdit(context, listing),
            ),
            const HorizontalSpace(4),
            _buildCircularIconButton(
              icon: Icons.delete_rounded,
              onPressed: () => showDeleteConfirmationSheet(
                context,
                title: context.l10n.deleteListingConfirmTitle,
                body: context.l10n.deleteListingConfirmBody,
                onConfirm: () => _deleteListing(context),
              ),
            ),
          ],
          const HorizontalSpace(4),
          if (!isOwner) ...[
            _buildCircularIconButton(
              icon: isReported
                  ? Icons.flag_rounded
                  : Icons.outlined_flag_rounded,
              onPressed: isReported
                  ? () {}
                  : () async {
                      if (!await GuestGuard.requireAccount(context)) return;
                      if (!context.mounted) return;
                      final reported = await showReportBottomSheet(
                        context,
                        entityType: ReportEntityType.listing,
                        entityId: listing.listingId,
                      );
                      if (reported == true && context.mounted) {
                        context.read<ListingDetailsCubit>().markAsReported();
                      }
                    },
            ),
          ],
        ],
      ),

      flexibleSpace: FlexibleSpaceBar(
        background: _buildImageCarousel(context, listing, isBookmarked),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }

  Widget _buildImageCarousel(
    BuildContext context,
    ListingDetailModel listing,
    bool isBookmarked,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        listing.imageUrls.isEmpty
            ? Container(
                color: MyColors.dark.outline,
                child: Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 80.sp,
                    color: Colors.white54,
                  ),
                ),
              )
            : _ImagePageView(imageUrls: listing.imageUrls),
      ],
    );
  }

  Widget _buildCircularIconButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: const BoxDecoration(
          color: Colors.black26,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Future<void> _navigateToEdit(
    BuildContext context,
    ListingDetailModel listing,
  ) async {
    final result = await Navigator.pushNamed(
      context,
      MyRoutes.editListing,
      arguments: listing,
    );
    if (result == true && context.mounted) {
      context.read<ListingDetailsCubit>().loadListing();
    }
  }

  Future<void> _deleteListing(BuildContext context) async {
    final l10n = context.l10n;
    final error = await context.read<ListingDetailsCubit>().deleteListing();
    if (!context.mounted) return;

    if (error == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.listingDeleted)));
      Navigator.pop(context, 'deleted');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
    }
  }
}

/// Stateful widget to track page index for the dot indicators.
class _ImagePageView extends StatefulWidget {
  final List<String> imageUrls;

  const _ImagePageView({required this.imageUrls});

  @override
  State<_ImagePageView> createState() => _ImagePageViewState();
}

class _ImagePageViewState extends State<_ImagePageView> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.imageUrls.length,
          onPageChanged: (index) => setState(() => _currentPage = index),
          itemBuilder: (context, index) =>
              _buildCachedImage(widget.imageUrls[index]),
        ),
        if (widget.imageUrls.length > 1)
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.imageUrls.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  width: _currentPage == i ? 24.w : 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: _currentPage == i
                        ? MyColors.primary.base
                        : Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(4.dg),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCachedImage(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: MyColors.dark.outline,
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
        color: MyColors.dark.outline,
        child: Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 80.sp,
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
