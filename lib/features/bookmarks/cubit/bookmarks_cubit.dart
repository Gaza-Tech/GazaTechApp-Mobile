import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/services/post_event_service.dart';
import '../data/repos/bookmarks_repo.dart';
import 'bookmarks_state.dart';

class BookmarksCubit extends Cubit<BookmarksState> {
  final BookmarksRepo _repo;
  final PostEventService _bookmarkEventService;
  late final StreamSubscription<ListingBookmarkEvent> _listingBookmarkSub;
  late final StreamSubscription<PostBookmarkEvent> _postBookmarkSub;

  BookmarksCubit(this._repo, this._bookmarkEventService)
    : super(const BookmarksState()) {
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
        : state.bookmarkedPosts.where((p) => p.postId != event.postId).toList();

    emit(
      state.copyWith(bookmarkedPostIds: updated, bookmarkedPosts: updatedPosts),
    );
  }

  Future<void> fetchBookmarkedPosts() async {
    emit(
      state.copyWith(
        isPostsLoading: true,
        postsPage: 0,
        bookmarkedPosts: [],
        errorMessage: null,
      ),
    );
    final result = await _repo.fetchBookmarkedPosts(0);
    result.when(
      success: (response) {
        final fetchedIds = response.posts.map((p) => p.postId).toSet();
        final newLikedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final newBookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();
        final cleanedLikedIds = state.likedPostIds.difference(fetchedIds);
        final cleanedBookmarkedIds = state.bookmarkedPostIds.difference(
          fetchedIds,
        );
        emit(
          state.copyWith(
            isPostsLoading: false,
            bookmarkedPosts: response.posts,
            postsPage: 0,
            postsHasMore: response.hasMore,
            likedPostIds: {...cleanedLikedIds, ...newLikedIds},
            bookmarkedPostIds: {...cleanedBookmarkedIds, ...newBookmarkedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(isPostsLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchMoreBookmarkedPosts() async {
    if (state.isPostsLoadingMore || !state.postsHasMore) return;
    final nextPage = state.postsPage + 1;
    emit(state.copyWith(isPostsLoadingMore: true));
    final result = await _repo.fetchBookmarkedPosts(nextPage);
    result.when(
      success: (response) {
        final fetchedIds = response.posts.map((p) => p.postId).toSet();
        final newLikedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final newBookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();
        final cleanedLikedIds = state.likedPostIds.difference(fetchedIds);
        final cleanedBookmarkedIds = state.bookmarkedPostIds.difference(
          fetchedIds,
        );
        emit(
          state.copyWith(
            isPostsLoadingMore: false,
            bookmarkedPosts: [...state.bookmarkedPosts, ...response.posts],
            postsPage: nextPage,
            postsHasMore: response.hasMore,
            likedPostIds: {...cleanedLikedIds, ...newLikedIds},
            bookmarkedPostIds: {...cleanedBookmarkedIds, ...newBookmarkedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(isPostsLoadingMore: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchBookmarkedListings() async {
    emit(
      state.copyWith(
        isListingsLoading: true,
        listingsPage: 0,
        bookmarkedListings: [],
        errorMessage: null,
      ),
    );
    final result = await _repo.fetchBookmarkedListings(0);
    result.when(
      success: (response) {
        final fetchedIds = response.listings.map((l) => l.listingId).toSet();
        final cleanedIds = state.bookmarkedListingIds.difference(fetchedIds);
        emit(
          state.copyWith(
            isListingsLoading: false,
            bookmarkedListings: response.listings,
            listingsPage: 0,
            listingsHasMore: response.hasMore,
            bookmarkedListingIds: {...cleanedIds, ...fetchedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(isListingsLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchMoreBookmarkedListings() async {
    if (state.isListingsLoadingMore || !state.listingsHasMore) return;
    final nextPage = state.listingsPage + 1;
    emit(state.copyWith(isListingsLoadingMore: true));
    final result = await _repo.fetchBookmarkedListings(nextPage);
    result.when(
      success: (response) {
        final fetchedIds = response.listings.map((l) => l.listingId).toSet();
        final cleanedIds = state.bookmarkedListingIds.difference(fetchedIds);
        emit(
          state.copyWith(
            isListingsLoadingMore: false,
            bookmarkedListings: [
              ...state.bookmarkedListings,
              ...response.listings,
            ],
            listingsPage: nextPage,
            listingsHasMore: response.hasMore,
            bookmarkedListingIds: {...cleanedIds, ...fetchedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          isListingsLoadingMore: false,
          errorMessage: error.message,
        ),
      ),
    );
  }

  Future<void> togglePostBookmark(String postId) async {
    final wasBookmarked = state.bookmarkedPostIds.contains(postId);
    final optimisticIds = Set<String>.from(state.bookmarkedPostIds);
    wasBookmarked ? optimisticIds.remove(postId) : optimisticIds.add(postId);

    final optimisticPosts = wasBookmarked
        ? state.bookmarkedPosts.where((p) => p.postId != postId).toList()
        : state.bookmarkedPosts;

    emit(
      state.copyWith(
        bookmarkedPostIds: optimisticIds,
        bookmarkedPosts: optimisticPosts,
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

  Future<void> togglePostLike(String postId) async {
    final wasLiked = state.likedPostIds.contains(postId);
    final newLikedIds = Set<String>.from(state.likedPostIds);
    wasLiked ? newLikedIds.remove(postId) : newLikedIds.add(postId);

    final delta = wasLiked ? -1 : 1;
    final updatedPosts = state.bookmarkedPosts.map((p) {
      if (p.postId == postId)
        return p.copyWith(likesCount: p.likesCount + delta);
      return p;
    }).toList();

    emit(
      state.copyWith(likedPostIds: newLikedIds, bookmarkedPosts: updatedPosts),
    );

    final result = await _repo.togglePostLike(postId);
    result.when(
      success: (_) {},
      failure: (_) {
        final revertIds = Set<String>.from(state.likedPostIds);
        wasLiked ? revertIds.add(postId) : revertIds.remove(postId);
        final revertedPosts = state.bookmarkedPosts.map((p) {
          if (p.postId == postId) {
            return p.copyWith(likesCount: p.likesCount - delta);
          }
          return p;
        }).toList();
        emit(
          state.copyWith(
            likedPostIds: revertIds,
            bookmarkedPosts: revertedPosts,
          ),
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
