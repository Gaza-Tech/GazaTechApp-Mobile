import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/services/post_event_service.dart';
import '../data/models/community_sort.dart';
import '../data/models/post_model.dart';
import '../data/repos/community_repo.dart';
import 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final CommunityRepo _repo;
  final PostEventService _bookmarkEventService;
  late final StreamSubscription<PostBookmarkEvent> _bookmarkSub;
  late final StreamSubscription<PostLikeEvent> _likeSub;
  late final StreamSubscription<PostCommentCountEvent> _commentCountSub;

  CommunityCubit(this._repo, this._bookmarkEventService)
    : super(const CommunityState()) {
    _bookmarkSub = _bookmarkEventService.postBookmarkChanges.listen(
      _onPostBookmarkEvent,
    );
    _likeSub = _bookmarkEventService.postLikeChanges.listen(_onPostLikeEvent);
    _commentCountSub = _bookmarkEventService.postCommentCountChanges.listen(
      _onPostCommentCountEvent,
    );
  }

  void _onPostLikeEvent(PostLikeEvent event) {
    final newLikedIds = Set<String>.from(state.likedPostIds);
    event.isLiked
        ? newLikedIds.add(event.postId)
        : newLikedIds.remove(event.postId);

    final updatedPosts = <String, List<PostModel>>{};
    for (final entry in state.postsByCategory.entries) {
      updatedPosts[entry.key] = entry.value.map((p) {
        if (p.postId == event.postId) {
          return p.copyWith(likesCount: event.likesCount);
        }
        return p;
      }).toList();
    }
    emit(
      state.copyWith(likedPostIds: newLikedIds, postsByCategory: updatedPosts),
    );
  }

  void _onPostCommentCountEvent(PostCommentCountEvent event) {
    final updatedPosts = <String, List<PostModel>>{};
    for (final entry in state.postsByCategory.entries) {
      updatedPosts[entry.key] = entry.value.map((p) {
        if (p.postId == event.postId) {
          return p.copyWith(commentsCount: event.commentsCount);
        }
        return p;
      }).toList();
    }
    emit(state.copyWith(postsByCategory: updatedPosts));
  }

  void _onPostBookmarkEvent(PostBookmarkEvent event) {
    final current = state.bookmarkedPostIds;
    if (current.contains(event.postId) == event.isBookmarked) return;

    final updated = Set<String>.from(current);
    event.isBookmarked
        ? updated.add(event.postId)
        : updated.remove(event.postId);
    emit(state.copyWith(bookmarkedPostIds: updated));
  }

  void changeCategory(String category) {
    if (state.selectedCategory == category) return;
    emit(state.copyWith(selectedCategory: category));
  }

  Future<void> fetchIfNeeded(String category) async {
    if (state.postsByCategory.containsKey(category) &&
        state.postsByCategory[category]!.isNotEmpty) {
      return;
    }
    await fetchPosts(category);
  }

  void updateSort(CommunitySort sort) {
    if (state.activeSort == sort) return;
    emit(
      state.copyWith(
        activeSort: sort,
        postsByCategory: {},
        currentPageByCategory: {},
        hasMoreByCategory: {},
      ),
    );
    fetchPosts(state.selectedCategory);
  }

  Future<void> fetchPosts(String category) async {
    emit(state.copyWith(isInitialLoading: true, errorMessage: null));

    final result = await _repo.fetchPosts(
      category: category == 'all' ? null : category,
      page: 0,
      sort: state.activeSort,
    );

    result.when(
      success: (response) {
        final fetchedPostIds = response.posts.map((p) => p.postId).toSet();
        final newLikedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final newBookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();
        final cleanedLikedIds = state.likedPostIds.difference(fetchedPostIds);
        final cleanedBookmarkedIds =
            state.bookmarkedPostIds.difference(fetchedPostIds);

        final updatedPosts = Map<String, List<PostModel>>.from(
          state.postsByCategory,
        )..[category] = response.posts;

        final updatedPages = Map<String, int>.from(state.currentPageByCategory)
          ..[category] = 0;

        final updatedHasMore = Map<String, bool>.from(state.hasMoreByCategory)
          ..[category] = response.hasMore;

        emit(
          state.copyWith(
            postsByCategory: updatedPosts,
            currentPageByCategory: updatedPages,
            hasMoreByCategory: updatedHasMore,
            isInitialLoading: false,
            likedPostIds: {...cleanedLikedIds, ...newLikedIds},
            bookmarkedPostIds: {...cleanedBookmarkedIds, ...newBookmarkedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(isInitialLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchMore(String category) async {
    if (state.isLoadingMore || !state.hasMoreFor(category)) return;

    final nextPage = state.currentPageFor(category) + 1;

    emit(state.copyWith(isLoadingMore: true));

    final result = await _repo.fetchPosts(
      category: category == 'all' ? null : category,
      page: nextPage,
      sort: state.activeSort,
    );

    result.when(
      success: (response) {
        final fetchedPostIds = response.posts.map((p) => p.postId).toSet();
        final newLikedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final newBookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();
        final cleanedLikedIds = state.likedPostIds.difference(fetchedPostIds);
        final cleanedBookmarkedIds =
            state.bookmarkedPostIds.difference(fetchedPostIds);

        final current = state.postsByCategory[category] ?? [];
        final updatedPosts = Map<String, List<PostModel>>.from(
          state.postsByCategory,
        )..[category] = [...current, ...response.posts];

        final updatedPages = Map<String, int>.from(state.currentPageByCategory)
          ..[category] = nextPage;

        final updatedHasMore = Map<String, bool>.from(state.hasMoreByCategory)
          ..[category] = response.hasMore;

        emit(
          state.copyWith(
            postsByCategory: updatedPosts,
            currentPageByCategory: updatedPages,
            hasMoreByCategory: updatedHasMore,
            isLoadingMore: false,
            likedPostIds: {...cleanedLikedIds, ...newLikedIds},
            bookmarkedPostIds: {...cleanedBookmarkedIds, ...newBookmarkedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(isLoadingMore: false, errorMessage: error.message),
      ),
    );
  }

  void resetPagination(String category) {
    final updatedPages = Map<String, int>.from(state.currentPageByCategory)
      ..remove(category);
    final updatedHasMore = Map<String, bool>.from(state.hasMoreByCategory)
      ..remove(category);
    emit(
      state.copyWith(
        currentPageByCategory: updatedPages,
        hasMoreByCategory: updatedHasMore,
      ),
    );
  }

  Future<void> toggleLike(String postId) async {
    final wasLiked = state.likedPostIds.contains(postId);
    final newLikedIds = Set<String>.from(state.likedPostIds);
    wasLiked ? newLikedIds.remove(postId) : newLikedIds.add(postId);

    final delta = wasLiked ? -1 : 1;
    final updatedPosts = <String, List<PostModel>>{};
    for (final entry in state.postsByCategory.entries) {
      updatedPosts[entry.key] = entry.value.map((p) {
        if (p.postId == postId) {
          return p.copyWith(likesCount: p.likesCount + delta);
        }
        return p;
      }).toList();
    }
    emit(
      state.copyWith(likedPostIds: newLikedIds, postsByCategory: updatedPosts),
    );

    final result = await _repo.togglePostLike(postId);
    result.when(
      success: (_) {},
      failure: (_) {
        final revertIds = Set<String>.from(state.likedPostIds);
        wasLiked ? revertIds.add(postId) : revertIds.remove(postId);

        final revertedPosts = <String, List<PostModel>>{};
        for (final entry in state.postsByCategory.entries) {
          revertedPosts[entry.key] = entry.value.map((p) {
            if (p.postId == postId) {
              return p.copyWith(likesCount: p.likesCount - delta);
            }
            return p;
          }).toList();
        }
        emit(
          state.copyWith(
            likedPostIds: revertIds,
            postsByCategory: revertedPosts,
          ),
        );
      },
    );
  }

  Future<void> toggleBookmark(String postId) async {
    final wasBookmarked = state.bookmarkedPostIds.contains(postId);
    final newBookmarkedIds = Set<String>.from(state.bookmarkedPostIds);
    wasBookmarked
        ? newBookmarkedIds.remove(postId)
        : newBookmarkedIds.add(postId);
    emit(state.copyWith(bookmarkedPostIds: newBookmarkedIds));
    _bookmarkEventService.emitPostBookmark(
      postId,
      isBookmarked: !wasBookmarked,
    );

    final result = await _repo.toggleBookmark(postId);
    result.when(
      success: (_) {},
      failure: (_) {
        final revertIds = Set<String>.from(state.bookmarkedPostIds);
        wasBookmarked ? revertIds.add(postId) : revertIds.remove(postId);
        emit(state.copyWith(bookmarkedPostIds: revertIds));
        _bookmarkEventService.emitPostBookmark(
          postId,
          isBookmarked: wasBookmarked,
        );
      },
    );
  }

  @override
  Future<void> close() {
    _bookmarkSub.cancel();
    _likeSub.cancel();
    _commentCountSub.cancel();
    return super.close();
  }
}
