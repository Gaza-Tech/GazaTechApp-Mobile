import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/services/bookmark_event_service.dart';
import 'package:gaza_tech/features/profile/data/repos/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _repo;
  final String _userId;
  final BookmarkEventService _bookmarkEventService;
  late final StreamSubscription<ListingBookmarkEvent> _listingBookmarkSub;
  late final StreamSubscription<PostBookmarkEvent> _postBookmarkSub;

  ProfileCubit(
    this._repo,
    this._userId,
    bool isOwnProfile,
    this._bookmarkEventService,
  ) : super(ProfileState(isOwnProfile: isOwnProfile)) {
    _listingBookmarkSub = _bookmarkEventService.listingBookmarkChanges.listen(
      _onListingBookmarkEvent,
    );
    _postBookmarkSub = _bookmarkEventService.postBookmarkChanges.listen(
      _onPostBookmarkEvent,
    );
  }

  void _onListingBookmarkEvent(ListingBookmarkEvent event) {
    final current = state.bookmarkedListingIds;
    if (current.contains(event.listingId) == event.isBookmarked) return;

    final updated = Set<String>.from(current);
    event.isBookmarked
        ? updated.add(event.listingId)
        : updated.remove(event.listingId);

    final updatedListings = event.isBookmarked
        ? state.bookmarkedListings
        : state.bookmarkedListings
              .where((l) => l.listingId != event.listingId)
              .toList();

    emit(
      state.copyWith(
        bookmarkedListingIds: updated,
        bookmarkedListings: updatedListings,
      ),
    );
  }

  void _onPostBookmarkEvent(PostBookmarkEvent event) {
    final current = state.bookmarkedPostIds;
    if (current.contains(event.postId) == event.isBookmarked) return;

    final updated = Set<String>.from(current);
    event.isBookmarked
        ? updated.add(event.postId)
        : updated.remove(event.postId);

    final updatedPosts = event.isBookmarked
        ? state.bookmarkedPosts
        : state.bookmarkedPosts
              .where((p) => p.postId != event.postId)
              .toList();

    emit(
      state.copyWith(
        bookmarkedPostIds: updated,
        bookmarkedPosts: updatedPosts,
      ),
    );
  }

  Future<void> loadProfile() async {
    emit(state.copyWith(isProfileLoading: true, errorMessage: null));
    final result = await _repo.fetchUserProfile(_userId);
    result.when(
      success: (profile) =>
          emit(state.copyWith(isProfileLoading: false, userProfile: profile)),
      failure: (error) => emit(
        state.copyWith(isProfileLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchPosts() async {
    emit(state.copyWith(isPostsLoading: true, postsPage: 0, posts: []));
    final result = await _repo.fetchUserPosts(_userId, 0);
    result.when(
      success: (response) {
        final fetchedPostIds = response.posts.map((p) => p.postId).toSet();
        final likedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final bookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();
        final cleanedLikedIds = state.likedPostIds.difference(fetchedPostIds);
        final cleanedBookmarkedIds =
            state.bookmarkedPostIds.difference(fetchedPostIds);
        emit(
          state.copyWith(
            isPostsLoading: false,
            posts: response.posts,
            postsPage: 0,
            postsHasMore: response.hasMore,
            likedPostIds: {...cleanedLikedIds, ...likedIds},
            bookmarkedPostIds: {...cleanedBookmarkedIds, ...bookmarkedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(isPostsLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchMorePosts() async {
    if (state.isPostsLoadingMore || !state.postsHasMore) return;
    final nextPage = state.postsPage + 1;
    emit(state.copyWith(isPostsLoadingMore: true));
    final result = await _repo.fetchUserPosts(_userId, nextPage);
    result.when(
      success: (response) {
        final fetchedPostIds = response.posts.map((p) => p.postId).toSet();
        final likedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final bookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();
        final cleanedLikedIds = state.likedPostIds.difference(fetchedPostIds);
        final cleanedBookmarkedIds =
            state.bookmarkedPostIds.difference(fetchedPostIds);
        emit(
          state.copyWith(
            isPostsLoadingMore: false,
            posts: [...state.posts, ...response.posts],
            postsPage: nextPage,
            postsHasMore: response.hasMore,
            likedPostIds: {...cleanedLikedIds, ...likedIds},
            bookmarkedPostIds: {...cleanedBookmarkedIds, ...bookmarkedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(isPostsLoadingMore: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchListings() async {
    emit(
      state.copyWith(isListingsLoading: true, listingsPage: 0, listings: []),
    );
    final result = await _repo.fetchUserListings(_userId, 0);
    result.when(
      success: (response) => emit(
        state.copyWith(
          isListingsLoading: false,
          listings: response.listings,
          listingsPage: 0,
          listingsHasMore: response.hasMore,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(isListingsLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchMoreListings() async {
    if (state.isListingsLoadingMore || !state.listingsHasMore) return;
    final nextPage = state.listingsPage + 1;
    emit(state.copyWith(isListingsLoadingMore: true));
    final result = await _repo.fetchUserListings(_userId, nextPage);
    result.when(
      success: (response) => emit(
        state.copyWith(
          isListingsLoadingMore: false,
          listings: [...state.listings, ...response.listings],
          listingsPage: nextPage,
          listingsHasMore: response.hasMore,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(
          isListingsLoadingMore: false,
          errorMessage: error.message,
        ),
      ),
    );
  }

  Future<void> fetchBookmarkedPosts() async {
    if (!state.isOwnProfile) return;
    emit(
      state.copyWith(
        isBookmarksLoading: true,
        bookmarksPage: 0,
        bookmarkedPosts: [],
      ),
    );
    final result = await _repo.fetchBookmarkedPosts(0);
    result.when(
      success: (response) {
        final fetchedPostIds = response.posts.map((p) => p.postId).toSet();
        final likedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final bookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();
        final cleanedLikedIds = state.likedPostIds.difference(fetchedPostIds);
        final cleanedBookmarkedIds =
            state.bookmarkedPostIds.difference(fetchedPostIds);
        emit(
          state.copyWith(
            isBookmarksLoading: false,
            bookmarkedPosts: response.posts,
            bookmarksPage: 0,
            bookmarksHasMore: response.hasMore,
            likedPostIds: {...cleanedLikedIds, ...likedIds},
            bookmarkedPostIds: {...cleanedBookmarkedIds, ...bookmarkedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(isBookmarksLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchMoreBookmarkedPosts() async {
    if (state.isBookmarksLoadingMore || !state.bookmarksHasMore) return;
    final nextPage = state.bookmarksPage + 1;
    emit(state.copyWith(isBookmarksLoadingMore: true));
    final result = await _repo.fetchBookmarkedPosts(nextPage);
    result.when(
      success: (response) {
        final fetchedPostIds = response.posts.map((p) => p.postId).toSet();
        final likedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final cleanedLikedIds = state.likedPostIds.difference(fetchedPostIds);
        emit(
          state.copyWith(
            isBookmarksLoadingMore: false,
            bookmarkedPosts: [...state.bookmarkedPosts, ...response.posts],
            bookmarksPage: nextPage,
            bookmarksHasMore: response.hasMore,
            likedPostIds: {...cleanedLikedIds, ...likedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          isBookmarksLoadingMore: false,
          errorMessage: error.message,
        ),
      ),
    );
  }

  void toggleLike(String postId) {
    final wasLiked = state.likedPostIds.contains(postId);
    final newIds = Set<String>.from(state.likedPostIds);
    wasLiked ? newIds.remove(postId) : newIds.add(postId);
    final delta = wasLiked ? -1 : 1;

    emit(
      state.copyWith(
        likedPostIds: newIds,
        posts: state.posts.map((p) {
          if (p.postId == postId)
            return p.copyWith(likesCount: p.likesCount + delta);
          return p;
        }).toList(),
        bookmarkedPosts: state.bookmarkedPosts.map((p) {
          if (p.postId == postId)
            return p.copyWith(likesCount: p.likesCount + delta);
          return p;
        }).toList(),
      ),
    );
  }

  Future<void> toggleBookmark(String postId) async {
    final wasBookmarked = state.bookmarkedPostIds.contains(postId);
    final optimisticIds = Set<String>.from(state.bookmarkedPostIds);
    wasBookmarked ? optimisticIds.remove(postId) : optimisticIds.add(postId);

    // Remove from bookmarkedPosts list when unbookmarking (optimistic)
    final optimisticBookmarkedPosts = wasBookmarked
        ? state.bookmarkedPosts.where((p) => p.postId != postId).toList()
        : state.bookmarkedPosts;

    emit(
      state.copyWith(
        bookmarkedPostIds: optimisticIds,
        bookmarkedPosts: optimisticBookmarkedPosts,
      ),
    );
    _bookmarkEventService.emitPostBookmark(
      postId,
      isBookmarked: !wasBookmarked,
    );

    final result = await _repo.togglePostBookmark(postId);

    result.when(
      success: (_) {},
      failure: (_) {
        // Revert on failure
        final revertedIds = Set<String>.from(state.bookmarkedPostIds);
        wasBookmarked ? revertedIds.add(postId) : revertedIds.remove(postId);
        emit(state.copyWith(bookmarkedPostIds: revertedIds));
        _bookmarkEventService.emitPostBookmark(
          postId,
          isBookmarked: wasBookmarked,
        );
      },
    );
  }

  Future<void> fetchBookmarkedListings() async {
    if (!state.isOwnProfile) return;
    emit(
      state.copyWith(
        isListingBookmarksLoading: true,
        listingBookmarksPage: 0,
        bookmarkedListings: [],
      ),
    );
    final result = await _repo.fetchBookmarkedListings(0);
    result.when(
      success: (response) {
        final fetchedIds = response.listings.map((l) => l.listingId).toSet();
        final cleanedIds = state.bookmarkedListingIds.difference(fetchedIds);
        emit(
          state.copyWith(
            isListingBookmarksLoading: false,
            bookmarkedListings: response.listings,
            listingBookmarksPage: 0,
            listingBookmarksHasMore: response.hasMore,
            bookmarkedListingIds: {...cleanedIds, ...fetchedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          isListingBookmarksLoading: false,
          errorMessage: error.message,
        ),
      ),
    );
  }

  Future<void> fetchMoreBookmarkedListings() async {
    if (state.isListingBookmarksLoadingMore || !state.listingBookmarksHasMore) {
      return;
    }
    final nextPage = state.listingBookmarksPage + 1;
    emit(state.copyWith(isListingBookmarksLoadingMore: true));
    final result = await _repo.fetchBookmarkedListings(nextPage);
    result.when(
      success: (response) {
        final fetchedIds = response.listings.map((l) => l.listingId).toSet();
        final cleanedIds = state.bookmarkedListingIds.difference(fetchedIds);
        emit(
          state.copyWith(
            isListingBookmarksLoadingMore: false,
            bookmarkedListings: [
              ...state.bookmarkedListings,
              ...response.listings,
            ],
            listingBookmarksPage: nextPage,
            listingBookmarksHasMore: response.hasMore,
            bookmarkedListingIds: {...cleanedIds, ...fetchedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          isListingBookmarksLoadingMore: false,
          errorMessage: error.message,
        ),
      ),
    );
  }

  Future<void> toggleListingBookmark(String listingId) async {
    final wasBookmarked = state.bookmarkedListingIds.contains(listingId);
    final optimisticIds = Set<String>.from(state.bookmarkedListingIds);
    wasBookmarked
        ? optimisticIds.remove(listingId)
        : optimisticIds.add(listingId);

    final optimisticListings = wasBookmarked
        ? state.bookmarkedListings
              .where((l) => l.listingId != listingId)
              .toList()
        : state.bookmarkedListings;

    emit(
      state.copyWith(
        bookmarkedListingIds: optimisticIds,
        bookmarkedListings: optimisticListings,
      ),
    );
    _bookmarkEventService.emitListingBookmark(
      listingId,
      isBookmarked: !wasBookmarked,
    );

    final result = await _repo.toggleListingBookmark(listingId);

    result.when(
      success: (_) {},
      failure: (_) {
        // Revert on failure
        final revertedIds = Set<String>.from(state.bookmarkedListingIds);
        wasBookmarked
            ? revertedIds.add(listingId)
            : revertedIds.remove(listingId);
        emit(state.copyWith(bookmarkedListingIds: revertedIds));
        _bookmarkEventService.emitListingBookmark(
          listingId,
          isBookmarked: wasBookmarked,
        );
      },
    );
  }

  @override
  Future<void> close() {
    _listingBookmarkSub.cancel();
    _postBookmarkSub.cancel();
    return super.close();
  }
}
