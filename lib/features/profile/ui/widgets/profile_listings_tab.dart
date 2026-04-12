import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/delete_confirmation_sheet.dart';
import 'package:gaza_tech/features/profile/cubit/profile_cubit.dart';
import 'package:gaza_tech/features/profile/cubit/profile_state.dart';

class ProfileListingsTab extends StatefulWidget {
  const ProfileListingsTab({super.key});

  @override
  State<ProfileListingsTab> createState() => _ProfileListingsTabState();
}

class _ProfileListingsTabState extends State<ProfileListingsTab>
    with AutomaticKeepAliveClientMixin {
  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        notification.metrics.extentAfter == 0) {
      context.read<ProfileCubit>().fetchMoreListings();
    }
    return false;
  }

  Future<void> _navigateToDetails(
    BuildContext context,
    String listingId,
  ) async {
    final result = await Navigator.pushNamed(
      context,
      MyRoutes.listingDetails,
      arguments: listingId,
    );
    if (!context.mounted) return;
    if (result == 'deleted' || result == true) {
      context.read<ProfileCubit>().fetchListings();
    }
  }

  void _showDeleteConfirmation(BuildContext context, String listingId) {
    final l10n = context.l10n;
    showDeleteConfirmationSheet(
      context,
      title: l10n.deleteListingConfirmTitle,
      body: l10n.deleteListingConfirmBody,
      onConfirm: () async {
        final success = await context.read<ProfileCubit>().deleteListing(
          listingId,
        );
        if (success && context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.listingDeleted)));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.isListingsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.listings.isEmpty) {
          return Center(child: Text(context.l10n.noListingsYet));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(16.w),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: state.listings.length,
                  itemBuilder: (context, index) {
                    final listing = state.listings[index];
                    return _ListingCard(
                      listing: listing,
                      isOwnProfile: state.isOwnProfile,
                      onTap: () =>
                          _navigateToDetails(context, listing.listingId),
                      onEdit: () =>
                          _navigateToDetails(context, listing.listingId),
                      onDelete: () =>
                          _showDeleteConfirmation(context, listing.listingId),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: state.isListingsLoadingMore
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : SizedBox(height: 80.h),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ListingCard extends StatelessWidget {
  final dynamic listing;
  final bool isOwnProfile;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ListingCard({
    required this.listing,
    required this.isOwnProfile,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final thumbnailUrl = listing.thumbnailUrl;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  thumbnailUrl != null
                      ? CachedNetworkImage(
                          imageUrl: thumbnailUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (_, __) => Container(
                            color: theme.colorScheme.surfaceContainerHighest,
                          ),
                          errorWidget: (_, __, ___) => Container(
                            color: theme.colorScheme.surfaceContainerHighest,
                            child: const Icon(
                              Icons.image_not_supported_outlined,
                            ),
                          ),
                        )
                      : Container(
                          color: theme.colorScheme.surfaceContainerHighest,
                          child: const Center(
                            child: Icon(Icons.image_outlined),
                          ),
                        ),
                  if (isOwnProfile)
                    Positioned(
                      top: 4.w,
                      right: 4.w,
                      child: _MoreMenuButton(
                        onEdit: onEdit,
                        onDelete: onDelete,
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listing.title,
                      style: MyTextStyle.body.s.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      '${listing.currency == "ILS" ? "₪" : "\$"}${listing.price}',
                      style: MyTextStyle.action.m.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoreMenuButton extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _MoreMenuButton({required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black54,
        shape: BoxShape.circle,
      ),
      child: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.h),
        iconSize: 18.sp,
        icon: Icon(Icons.more_vert, color: Colors.white, size: 18.sp),
        onSelected: (value) {
          if (value == 'edit') onEdit();
          if (value == 'delete') onDelete();
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'edit',
            child: Row(
              children: [
                const Icon(Icons.edit_outlined, size: 20),
                SizedBox(width: 8.w),
                Text(l10n.edit),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Row(
              children: [
                Icon(
                  Icons.delete_outlined,
                  size: 20,
                  color: Theme.of(context).colorScheme.error,
                ),
                SizedBox(width: 8.w),
                Text(
                  l10n.delete,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
