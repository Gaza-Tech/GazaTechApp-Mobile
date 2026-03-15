import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/repos/community_repo.dart';
import 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final CommunityRepo _repo;

  CommunityCubit(this._repo) : super(const CommunityState());

  Future<void> fetchPosts() async {
    if (state.isPostsLoading) return;

    emit(
      state.copyWith(
        isPostsLoading: true,
        errorMessage: null,
        posts: [],
        currentPage: 0,
        hasMore: true,
        likedPostIds: {},
        bookmarkedPostIds: {},
      ),
    );

    final result = await _repo.fetchPosts(
      category: state.selectedCategory == 'all' ? null : state.selectedCategory,
      page: 0,
    );

    result.when(
      success: (response) {
        final likedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        final bookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();

        emit(
          state.copyWith(
            isPostsLoading: false,
            posts: response.posts,
            hasMore: response.hasMore,
            currentPage: 1,
            likedPostIds: likedIds,
            bookmarkedPostIds: bookmarkedIds,
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(
          isPostsLoading: false,
          errorMessage: error.message,
        ),
      ),
    );
  }

  Future<void> changeCategory(String category) async {
    if (state.selectedCategory == category) return;
    emit(state.copyWith(selectedCategory: category));
    await fetchPosts();
  }

  Future<void> fetchMorePosts() async {
    if (state.isLoadingMore || !state.hasMore || state.isPostsLoading) return;

    emit(state.copyWith(isLoadingMore: true));

    final result = await _repo.fetchPosts(
      category: state.selectedCategory == 'all' ? null : state.selectedCategory,
      page: state.currentPage,
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

        emit(
          state.copyWith(
            isLoadingMore: false,
            posts: [...state.posts, ...response.posts],
            hasMore: response.hasMore,
            currentPage: state.currentPage + 1,
            likedPostIds: {...state.likedPostIds, ...newLikedIds},
            bookmarkedPostIds: {...state.bookmarkedPostIds, ...newBookmarkedIds},
          ),
        );
      },
      failure: (error) => emit(
        state.copyWith(isLoadingMore: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> toggleLike(String postId) async {
    final wasLiked = state.likedPostIds.contains(postId);
    final newLikedIds = Set<String>.from(state.likedPostIds);
    wasLiked ? newLikedIds.remove(postId) : newLikedIds.add(postId);
    emit(state.copyWith(likedPostIds: newLikedIds));

    final result = await _repo.togglePostLike(postId);
    result.when(
      success: (_) {},
      failure: (_) {
        final revertIds = Set<String>.from(state.likedPostIds);
        wasLiked ? revertIds.add(postId) : revertIds.remove(postId);
        emit(state.copyWith(likedPostIds: revertIds));
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
