import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/community/data/models/post_model.dart';
import 'package:gaza_tech/features/marketplace/data/models/listing_model.dart';
import 'package:gaza_tech/features/profile/data/models/user_profile_model.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserProfileModel? userProfile,
    @Default(false) bool isOwnProfile,

    // Profile loading
    @Default(false) bool isProfileLoading,

    // Posts tab
    @Default([]) List<PostModel> posts,
    @Default(0) int postsPage,
    @Default(true) bool postsHasMore,
    @Default(false) bool isPostsLoading,
    @Default(false) bool isPostsLoadingMore,

    // Listings tab
    @Default([]) List<ListingModel> listings,
    @Default(0) int listingsPage,
    @Default(true) bool listingsHasMore,
    @Default(false) bool isListingsLoading,
    @Default(false) bool isListingsLoadingMore,

    // Bookmarks tab (own profile only)
    @Default([]) List<PostModel> bookmarkedPosts,
    @Default(0) int bookmarksPage,
    @Default(true) bool bookmarksHasMore,
    @Default(false) bool isBookmarksLoading,
    @Default(false) bool isBookmarksLoadingMore,

    // Bookmarked listings (own profile only)
    @Default([]) List<ListingModel> bookmarkedListings,
    @Default(0) int listingBookmarksPage,
    @Default(true) bool listingBookmarksHasMore,
    @Default(false) bool isListingBookmarksLoading,
    @Default(false) bool isListingBookmarksLoadingMore,
    @Default(<String>{}) Set<String> bookmarkedListingIds,

    // Like/bookmark tracking
    @Default(<String>{}) Set<String> likedPostIds,
    @Default(<String>{}) Set<String> bookmarkedPostIds,

    String? errorMessage,
  }) = _ProfileState;
}
