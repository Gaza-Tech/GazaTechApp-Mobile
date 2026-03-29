import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/listing_details/cubit/listing_details_cubit.dart';
import 'package:gaza_tech/features/listing_details/cubit/listing_details_state.dart';
import 'package:gaza_tech/features/listing_details/data/models/listing_detail_model.dart';
import 'package:gaza_tech/core/widgets/delete_confirmation_sheet.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/listing_details_body.dart';
import 'package:gaza_tech/features/listing_details/ui/widgets/listing_details_error_view.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          BlocBuilder<ListingDetailsCubit, ListingDetailsState>(
            builder: (context, state) {
              final listing = state.whenOrNull(
                success: (listing, _, __, ___) => listing,
              );
              final currentUserId =
                  Supabase.instance.client.auth.currentUser?.id;
              final isOwner =
                  listing != null && listing.sellerId == currentUserId;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isOwner) ...[
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () => _navigateToEdit(context, listing),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outlined),
                      onPressed: () => showDeleteConfirmationSheet(
                        context,
                        title: context.l10n.deleteListingConfirmTitle,
                        body: context.l10n.deleteListingConfirmBody,
                        onConfirm: () => _deleteListing(context),
                      ),
                    ),
                  ],
                  IconButton(
                    icon: const Icon(Icons.share_rounded),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.flag_rounded),
                    onPressed: () {},
                  ),
                  SizedBox(width: 4.w),
                ],
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ListingDetailsCubit, ListingDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (message) => ListingDetailsErrorView(message: message),
            success: (listing, similarListings, sellerListings, isBookmarked) =>
                ListingDetailsBody(
              listing: listing,
              similarListings: similarListings,
              sellerListings: sellerListings,
              isBookmarked: isBookmarked,
            ),
          );
        },
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
    final success = await context.read<ListingDetailsCubit>().deleteListing();
    if (!context.mounted) return;

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.listingDeleted)));
      Navigator.pop(context, 'deleted');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.deleteListingConfirmBody)));
    }
  }
}
