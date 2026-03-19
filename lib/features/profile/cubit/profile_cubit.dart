import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/profile/data/repos/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _repo;
  final String _userId;

  ProfileCubit(this._repo, this._userId, bool isOwnProfile)
    : super(ProfileState(isOwnProfile: isOwnProfile));

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
            postsPage: 0,
            postsHasMore: response.hasMore,
            likedPostIds: {...state.likedPostIds, ...likedIds},
            bookmarkedPostIds: {...state.bookmarkedPostIds, ...bookmarkedIds},
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
            isPostsLoadingMore: false,
            posts: [...state.posts, ...response.posts],
            postsPage: nextPage,
            postsHasMore: response.hasMore,
            likedPostIds: {...state.likedPostIds, ...likedIds},
            bookmarkedPostIds: {...state.bookmarkedPostIds, ...bookmarkedIds},
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
            isBookmarksLoading: false,
            bookmarkedPosts: response.posts,
            bookmarksPage: 0,
            bookmarksHasMore: response.hasMore,
            likedPostIds: {...state.likedPostIds, ...likedIds},
            bookmarkedPostIds: {...state.bookmarkedPostIds, ...bookmarkedIds},
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
        final likedIds = response.posts
            .where((p) => p.isLiked)
            .map((p) => p.postId)
            .toSet();
        emit(
          state.copyWith(
            isBookmarksLoadingMore: false,
            bookmarkedPosts: [...state.bookmarkedPosts, ...response.posts],
            bookmarksPage: nextPage,
            bookmarksHasMore: response.hasMore,
            likedPostIds: {...state.likedPostIds, ...likedIds},
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

  void toggleBookmark(String postId) {
    final wasBookmarked = state.bookmarkedPostIds.contains(postId);
    final newIds = Set<String>.from(state.bookmarkedPostIds);
    wasBookmarked ? newIds.remove(postId) : newIds.add(postId);
    emit(state.copyWith(bookmarkedPostIds: newIds));
  }
}
