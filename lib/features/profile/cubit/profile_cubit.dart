import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/core/services/post_event_service.dart';
import 'package:gaza_tech/core/services/report_event_service.dart';
import 'package:gaza_tech/features/report/data/models/report_reason.dart';
import 'package:gaza_tech/features/profile/data/repos/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _repo;
  final String _userId;
  final PostEventService _bookmarkEventService;
  final ReportEventService _reportEventService;
  late final StreamSubscription<PostBookmarkEvent> _postBookmarkSub;
  late final StreamSubscription<ReportEvent> _reportSub;

  ProfileCubit(
    this._repo,
    this._userId,
    bool isOwnProfile,
    this._bookmarkEventService,
    this._reportEventService,
  ) : super(ProfileState(isOwnProfile: isOwnProfile)) {
    _postBookmarkSub = _bookmarkEventService.postBookmarkChanges.listen(
      _onPostBookmarkEvent,
    );
    _reportSub = _reportEventService.reportChanges.listen(_onReportEvent);
  }

  void _onReportEvent(ReportEvent event) {
    if (event.entityType == ReportEntityType.user &&
        event.entityId == _userId) {
      emit(state.copyWith(isUserReported: event.isReported));
    }
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

  Future<void> loadProfile() async {
    emit(state.copyWith(isProfileLoading: true, errorMessage: null));
    final result = await _repo.fetchUserProfile(_userId);
    result.when(
      success: (profile) {
        emit(state.copyWith(isProfileLoading: false, userProfile: profile));
        if (state.isOwnProfile && !profile.isVerified) {
          _fetchVerificationStatus();
        }
        if (!state.isOwnProfile) {
          _fetchIsUserReported();
        }
      },
      failure: (error) => emit(
        state.copyWith(isProfileLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> _fetchIsUserReported() async {
    final result = await _repo.isUserReported(_userId);
    result.when(
      success: (isReported) =>
          emit(state.copyWith(isUserReported: isReported)),
      failure: (_) {},
    );
  }

  void markUserAsReported() {
    emit(state.copyWith(isUserReported: true));
    _reportEventService.emitReport(
      ReportEntityType.user,
      _userId,
      isReported: true,
    );
  }

  Future<void> _fetchVerificationStatus() async {
    final result = await _repo.fetchVerificationStatus(_userId);
    result.when(
      success: (status) => emit(state.copyWith(verificationStatus: status)),
      failure: (_) {},
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
        final cleanedBookmarkedIds = state.bookmarkedPostIds.difference(
          fetchedPostIds,
        );
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
        final cleanedBookmarkedIds = state.bookmarkedPostIds.difference(
          fetchedPostIds,
        );
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
      ),
    );
  }

  Future<void> toggleBookmark(String postId) async {
    final wasBookmarked = state.bookmarkedPostIds.contains(postId);
    final optimisticIds = Set<String>.from(state.bookmarkedPostIds);
    wasBookmarked ? optimisticIds.remove(postId) : optimisticIds.add(postId);

    emit(state.copyWith(bookmarkedPostIds: optimisticIds));
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

  /// Soft delete a post and remove it from the local list
  Future<bool> deletePost(String postId) async {
    final result = await _repo.softDeletePost(postId);
    return result.when(
      success: (_) {
        emit(
          state.copyWith(
            posts: state.posts.where((p) => p.postId != postId).toList(),
          ),
        );
        return true;
      },
      failure: (error) {
        emit(state.copyWith(errorMessage: error.message));
        return false;
      },
    );
  }

  /// Soft delete a listing and remove it from the local list
  Future<bool> deleteListing(String listingId) async {
    final result = await _repo.softDeleteListing(listingId);
    return result.when(
      success: (_) {
        emit(
          state.copyWith(
            listings: state.listings
                .where((l) => l.listingId != listingId)
                .toList(),
          ),
        );
        return true;
      },
      failure: (error) {
        emit(state.copyWith(errorMessage: error.message));
        return false;
      },
    );
  }

  @override
  Future<void> close() {
    _postBookmarkSub.cancel();
    _reportSub.cancel();
    return super.close();
  }
}
