import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/profile/data/repos/profile_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'drafts_state.dart';

class DraftsCubit extends Cubit<DraftsState> {
  final ProfileRepo _repo;

  DraftsCubit(this._repo) : super(const DraftsState());

  String get _userId => Supabase.instance.client.auth.currentUser!.id;

  // Post drafts
  Future<void> fetchPostDrafts() async {
    emit(state.copyWith(isPostsLoading: true, postsPage: 0, posts: []));
    final result = await _repo.fetchUserDrafts(_userId, 0);
    result.when(
      success: (response) => emit(
        state.copyWith(
          isPostsLoading: false,
          posts: response.posts,
          postsPage: 0,
          postsHasMore: response.hasMore,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(isPostsLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> fetchMorePostDrafts() async {
    if (state.isPostsLoadingMore || !state.postsHasMore) return;
    final nextPage = state.postsPage + 1;
    emit(state.copyWith(isPostsLoadingMore: true));
    final result = await _repo.fetchUserDrafts(_userId, nextPage);
    result.when(
      success: (response) => emit(
        state.copyWith(
          isPostsLoadingMore: false,
          posts: [...state.posts, ...response.posts],
          postsPage: nextPage,
          postsHasMore: response.hasMore,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(isPostsLoadingMore: false, errorMessage: error.message),
      ),
    );
  }

  Future<bool> deletePostDraft(String postId) async {
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

  // Listing drafts

  Future<void> fetchListingDrafts() async {
    emit(state.copyWith(isListingsLoading: true, listingsPage: 0, listings: []));
    final result = await _repo.fetchUserListingDrafts(_userId, 0);
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

  Future<void> fetchMoreListingDrafts() async {
    if (state.isListingsLoadingMore || !state.listingsHasMore) return;
    final nextPage = state.listingsPage + 1;
    emit(state.copyWith(isListingsLoadingMore: true));
    final result = await _repo.fetchUserListingDrafts(_userId, nextPage);
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

  Future<bool> deleteListingDraft(String listingId) async {
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

  Future<bool> publishPostDraft(String postId) async {
    final result = await _repo.publishPost(postId);
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

  Future<bool> publishListingDraft(String listingId) async {
    final result = await _repo.publishListing(listingId);
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
}
