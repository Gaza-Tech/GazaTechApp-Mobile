import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/community/data/models/post_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';

part 'bookmarks_state.freezed.dart';

@freezed
abstract class BookmarksState with _$BookmarksState {
  const factory BookmarksState({
    // Posts tab
    @Default([]) List<PostModel> bookmarkedPosts,
    @Default(0) int postsPage,
    @Default(true) bool postsHasMore,
    @Default(false) bool isPostsLoading,
    @Default(false) bool isPostsLoadingMore,

    // Listings tab
    @Default([]) List<ListingModel> bookmarkedListings,
    @Default(0) int listingsPage,
    @Default(true) bool listingsHasMore,
    @Default(false) bool isListingsLoading,
    @Default(false) bool isListingsLoadingMore,

    // Tracking sets
    @Default(<String>{}) Set<String> likedPostIds,
    @Default(<String>{}) Set<String> bookmarkedPostIds,
    @Default(<String>{}) Set<String> bookmarkedListingIds,

    String? errorMessage,
  }) = _BookmarksState;
}
