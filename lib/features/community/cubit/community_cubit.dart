import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/models/community_sort.dart';
import '../data/models/post_model.dart';
import '../data/repos/community_repo.dart';
import 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final CommunityRepo _repo;

  CommunityCubit(this._repo) : super(const CommunityState());

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

  void updateTimeSort(CommunityTimeSort sort) {
    if (state.timeSort == sort) return;
    emit(state.copyWith(
      timeSort: sort,
      postsByCategory: {},
      currentPageByCategory: {},
      hasMoreByCategory: {},
    ));
    fetchPosts(state.selectedCategory);
  }

  void updatePopularitySort(CommunityPopularitySort sort) {
    final next = state.popularitySort == sort ? null : sort;
    emit(state.copyWith(
      popularitySort: next,
      postsByCategory: {},
      currentPageByCategory: {},
      hasMoreByCategory: {},
    ));
    fetchPosts(state.selectedCategory);
  }

  Future<void> fetchPosts(String category) async {
    emit(state.copyWith(
      isInitialLoading: true,
      errorMessage: null,
    ));

    final result = await _repo.fetchPosts(
      category: category == 'all' ? null : category,
      page: 0,
      timeSort: state.timeSort,
      popularitySort: state.popularitySort,
    );

    result.when(
      success: (response) {
        final newLikedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final newBookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();

        final updatedPosts = Map<String, List<PostModel>>.from(
          state.postsByCategory,
        )..[category] = response.posts;

        final updatedPages = Map<String, int>.from(
          state.currentPageByCategory,
        )..[category] = 0;

        final updatedHasMore = Map<String, bool>.from(
          state.hasMoreByCategory,
        )..[category] = response.hasMore;

        emit(state.copyWith(
          postsByCategory: updatedPosts,
          currentPageByCategory: updatedPages,
          hasMoreByCategory: updatedHasMore,
          isInitialLoading: false,
          likedPostIds: {...state.likedPostIds, ...newLikedIds},
          bookmarkedPostIds: {...state.bookmarkedPostIds, ...newBookmarkedIds},
        ));
      },
      failure: (error) => emit(state.copyWith(
        isInitialLoading: false,
        errorMessage: error.message,
      )),
    );
  }

  Future<void> fetchMore(String category) async {
    if (state.isLoadingMore || !state.hasMoreFor(category)) return;

    final nextPage = state.currentPageFor(category) + 1;

    emit(state.copyWith(isLoadingMore: true));

    final result = await _repo.fetchPosts(
      category: category == 'all' ? null : category,
      page: nextPage,
      timeSort: state.timeSort,
      popularitySort: state.popularitySort,
    );

    result.when(
      success: (response) {
        final newLikedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final newBookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();

        final current = state.postsByCategory[category] ?? [];
        final updatedPosts = Map<String, List<PostModel>>.from(
          state.postsByCategory,
        )..[category] = [...current, ...response.posts];

        final updatedPages = Map<String, int>.from(
          state.currentPageByCategory,
        )..[category] = nextPage;

        final updatedHasMore = Map<String, bool>.from(
          state.hasMoreByCategory,
        )..[category] = response.hasMore;

        emit(state.copyWith(
          postsByCategory: updatedPosts,
          currentPageByCategory: updatedPages,
          hasMoreByCategory: updatedHasMore,
          isLoadingMore: false,
          likedPostIds: {...state.likedPostIds, ...newLikedIds},
          bookmarkedPostIds: {...state.bookmarkedPostIds, ...newBookmarkedIds},
        ));
      },
      failure: (error) => emit(state.copyWith(
        isLoadingMore: false,
        errorMessage: error.message,
      )),
    );
  }

  void resetPagination(String category) {
    final updatedPages = Map<String, int>.from(state.currentPageByCategory)
      ..remove(category);
    final updatedHasMore = Map<String, bool>.from(state.hasMoreByCategory)
      ..remove(category);
    emit(state.copyWith(
      currentPageByCategory: updatedPages,
      hasMoreByCategory: updatedHasMore,
    ));
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
    emit(state.copyWith(likedPostIds: newLikedIds, postsByCategory: updatedPosts));

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
        emit(state.copyWith(likedPostIds: revertIds, postsByCategory: revertedPosts));
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

    final result = await _repo.toggleBookmark(postId);
    result.when(
      success: (_) {},
      failure: (_) {
        final revertIds = Set<String>.from(state.bookmarkedPostIds);
        wasBookmarked ? revertIds.add(postId) : revertIds.remove(postId);
        emit(state.copyWith(bookmarkedPostIds: revertIds));
      },
    );
  }
}
