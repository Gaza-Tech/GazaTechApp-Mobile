import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/services/bookmark_event_service.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import '../data/repos/listing_details_repo.dart';
import 'listing_details_state.dart';

class ListingDetailsCubit extends Cubit<ListingDetailsState> {
  final ListingDetailsRepo _repo;
  final String listingId;
  final BookmarkEventService _bookmarkEventService;
  late final StreamSubscription<ListingBookmarkEvent> _bookmarkSub;

  ListingDetailsCubit(this._repo, this.listingId, this._bookmarkEventService)
    : super(const ListingDetailsState.initial()) {
    _bookmarkSub = _bookmarkEventService.listingBookmarkChanges.listen(
      _onListingBookmarkEvent,
    );
  }

  void _onListingBookmarkEvent(ListingBookmarkEvent event) {
    if (event.listingId != listingId) return;

    final current = state.whenOrNull(
      success: (listing, similarListings, sellerListings, isBookmarked) => (
        listing: listing,
        similarListings: similarListings,
        sellerListings: sellerListings,
        isBookmarked: isBookmarked,
      ),
    );
    if (current == null || current.isBookmarked == event.isBookmarked) return;

    emit(
      ListingDetailsState.success(
        listing: current.listing,
        similarListings: current.similarListings,
        sellerListings: current.sellerListings,
        isBookmarked: event.isBookmarked,
      ),
    );
  }

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
            isBookmarked: listing.isBookmarked,
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

  /// Toggle bookmark (optimistic update)
  Future<void> toggleBookmark() async {
    final current = state.whenOrNull(
      success: (listing, similarListings, sellerListings, isBookmarked) => (
        listing: listing,
        similarListings: similarListings,
        sellerListings: sellerListings,
        isBookmarked: isBookmarked,
      ),
    );
    if (current == null) return;

    // Optimistic update
    emit(
      ListingDetailsState.success(
        listing: current.listing,
        similarListings: current.similarListings,
        sellerListings: current.sellerListings,
        isBookmarked: !current.isBookmarked,
      ),
    );
    _bookmarkEventService.emitListingBookmark(
      listingId,
      isBookmarked: !current.isBookmarked,
    );

    final result = await _repo.toggleListingBookmark(listingId);

    result.when(
      success: (_) {},
      failure: (_) {
        // Revert on failure
        emit(
          ListingDetailsState.success(
            listing: current.listing,
            similarListings: current.similarListings,
            sellerListings: current.sellerListings,
            isBookmarked: current.isBookmarked,
          ),
        );
        _bookmarkEventService.emitListingBookmark(
          listingId,
          isBookmarked: current.isBookmarked,
        );
      },
    );
  }

  @override
  Future<void> close() {
    _bookmarkSub.cancel();
    return super.close();
  }
}
