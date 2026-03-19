import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import '../data/repos/listing_details_repo.dart';
import 'listing_details_state.dart';

class ListingDetailsCubit extends Cubit<ListingDetailsState> {
  final ListingDetailsRepo _repo;
  final String listingId;

  ListingDetailsCubit(this._repo, this.listingId)
    : super(const ListingDetailsState.initial());

  /// Load listing details, similar listings, and seller listings
  Future<void> loadListing() async {
    emit(const ListingDetailsState.loading());

    final result = await _repo.getListingById(listingId);

    await result.when(
      success: (listing) async {
        // Fetch similar and seller listings in parallel
        final similarResult = _repo.getSimilarListings(
          categoryId: listing.categoryId,
          excludeListingId: listing.listingId,
        );
        final sellerResult = _repo.getSellerListings(
          sellerId: listing.sellerId,
          excludeListingId: listing.listingId,
        );

        final results = await Future.wait([similarResult, sellerResult]);

        final similarListings = results[0].when(
          success: (data) => data,
          failure: (_) => <ListingModel>[],
        );

        final sellerListings = results[1].when(
          success: (data) => data,
          failure: (_) => <ListingModel>[],
        );

        emit(
          ListingDetailsState.success(
            listing: listing,
            similarListings: similarListings,
            sellerListings: sellerListings,
          ),
        );

        // Increment view count in background (fire and forget)
        _repo.incrementViewCount(listingId);
      },
      failure: (error) {
        emit(
          ListingDetailsState.failure(
            error.message ?? 'Failed to load listing details',
          ),
        );
      },
    );
  }
}
