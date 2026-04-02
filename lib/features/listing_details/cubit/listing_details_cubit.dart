import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/services/bookmark_event_service.dart';
import 'package:gaza_tech/core/services/report_event_service.dart';
import 'package:gaza_tech/features/report/data/models/report_reason.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import '../data/models/listing_detail_model.dart';
import '../data/repos/listing_details_repo.dart';
import 'listing_details_state.dart';

class ListingDetailsCubit extends Cubit<ListingDetailsState> {
  final ListingDetailsRepo _repo;
  final String listingId;
  final BookmarkEventService _bookmarkEventService;
  final ReportEventService _reportEventService;
  late final StreamSubscription<ListingBookmarkEvent> _bookmarkSub;
  late final StreamSubscription<ReportEvent> _reportSub;

  ListingDetailsCubit(
    this._repo,
    this.listingId,
    this._bookmarkEventService,
    this._reportEventService,
  ) : super(const ListingDetailsState.initial()) {
    _bookmarkSub = _bookmarkEventService.listingBookmarkChanges.listen(
      _onListingBookmarkEvent,
    );
    _reportSub = _reportEventService.reportChanges.listen(_onReportEvent);
  }

  void _onReportEvent(ReportEvent event) {
    if (event.entityType != ReportEntityType.listing) return;
    if (event.entityId != listingId) return;

    final current = _currentSuccess;
    if (current == null) return;

    emit(
      ListingDetailsState.success(
        listing: current.listing,
        similarListings: current.similarListings,
        sellerListings: current.sellerListings,
        isBookmarked: current.isBookmarked,
        isReported: event.isReported,
      ),
    );
  }

  void _onListingBookmarkEvent(ListingBookmarkEvent event) {
    if (event.listingId != listingId) return;

    final current = _currentSuccess;
    if (current == null || current.isBookmarked == event.isBookmarked) return;

    emit(
      ListingDetailsState.success(
        listing: current.listing,
        similarListings: current.similarListings,
        sellerListings: current.sellerListings,
        isBookmarked: event.isBookmarked,
        isReported: current.isReported,
      ),
    );
  }

  ({
    ListingDetailModel listing,
    List<ListingModel> similarListings,
    List<ListingModel> sellerListings,
    bool isBookmarked,
    bool isReported,
  })? get _currentSuccess {
    return state.whenOrNull(
      success: (listing, similarListings, sellerListings, isBookmarked,
              isReported) =>
          (
            listing: listing,
            similarListings: similarListings,
            sellerListings: sellerListings,
            isBookmarked: isBookmarked,
            isReported: isReported,
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
            isReported: listing.isReported,
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
    final current = _currentSuccess;
    if (current == null) return;

    // Optimistic update
    emit(
      ListingDetailsState.success(
        listing: current.listing,
        similarListings: current.similarListings,
        sellerListings: current.sellerListings,
        isBookmarked: !current.isBookmarked,
        isReported: current.isReported,
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
            isReported: current.isReported,
          ),
        );
        _bookmarkEventService.emitListingBookmark(
          listingId,
          isBookmarked: current.isBookmarked,
        );
      },
    );
  }

  void markAsReported() {
    final current = _currentSuccess;
    if (current == null) return;

    emit(
      ListingDetailsState.success(
        listing: current.listing,
        similarListings: current.similarListings,
        sellerListings: current.sellerListings,
        isBookmarked: current.isBookmarked,
        isReported: true,
      ),
    );
    _reportEventService.emitReport(
      ReportEntityType.listing,
      listingId,
      isReported: true,
    );
  }

  /// Soft delete this listing
  Future<String?> deleteListing() async {
    final result = await _repo.softDeleteListing(listingId);
    return result.when(
      success: (_) => null,
      failure: (error) => error.message ?? 'Failed to delete listing',
    );
  }

  @override
  Future<void> close() {
    _bookmarkSub.cancel();
    _reportSub.cancel();
    return super.close();
  }
}
