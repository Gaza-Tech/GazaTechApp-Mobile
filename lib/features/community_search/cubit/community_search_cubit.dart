import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/cache/shared_pref_keys.dart';
import 'package:gaza_tech/core/helpers/shared_pref_helper.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import 'package:gaza_tech/features/community/data/repos/community_repo.dart';
import 'community_search_state.dart';

class CommunitySearchCubit extends Cubit<CommunitySearchState> {
  final CommunityRepo _repo;

  CommunitySearchCubit(this._repo) : super(const CommunitySearchState());

  final TextEditingController searchController = TextEditingController();

  Future<void> loadRecentSearches() async {
    final raw =
        await SharedPrefHelper.getString(SharedPrefKeys.communityRecentSearches);
    if (raw.isEmpty) return;
    try {
      final decoded = List<String>.from(jsonDecode(raw) as List);
      emit(state.copyWith(recentSearches: decoded));
    } catch (_) {}
  }

  Future<void> search() async {
    final keyword = searchController.text.trim();
    if (keyword.isEmpty) return;

    // Save to recent searches
    final updated = [
      keyword,
      ...state.recentSearches.where((s) => s != keyword),
    ];
    final capped = updated.take(10).toList();
    await SharedPrefHelper.setData(
      SharedPrefKeys.communityRecentSearches,
      jsonEncode(capped),
    );

    emit(state.copyWith(
      keyword: keyword,
      isSearching: true,
      results: [],
      currentPage: 0,
      hasMore: true,
      errorMessage: null,
      recentSearches: capped,
    ));

    final result = await _repo.searchPosts(keyword: keyword, page: 0);

    result.when(
      success: (response) {
        final likedIds =
            response.posts.where((p) => p.isLiked).map((p) => p.postId).toSet();
        final bookmarkedIds = response.posts
            .where((p) => p.isBookmarked)
            .map((p) => p.postId)
            .toSet();
        emit(state.copyWith(
          results: response.posts,
          hasMore: response.hasMore,
          currentPage: 0,
          isSearching: false,
          likedPostIds: likedIds,
          bookmarkedPostIds: bookmarkedIds,
        ));
      },
      failure: (error) => emit(state.copyWith(
        isSearching: false,
        errorMessage: error.message,
      )),
    );
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore || state.keyword.isEmpty) return;

    final nextPage = state.currentPage + 1;
    emit(state.copyWith(isLoadingMore: true));

    final result =
        await _repo.searchPosts(keyword: state.keyword, page: nextPage);

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
        emit(state.copyWith(
          results: [...state.results, ...response.posts],
          hasMore: response.hasMore,
          currentPage: nextPage,
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

  Future<void> removeRecentSearch(String query) async {
    final updated = state.recentSearches.where((s) => s != query).toList();
    await SharedPrefHelper.setData(
      SharedPrefKeys.communityRecentSearches,
      jsonEncode(updated),
    );
    emit(state.copyWith(recentSearches: updated));
  }

  Future<void> clearRecentSearches() async {
    await SharedPrefHelper.removeData(SharedPrefKeys.communityRecentSearches);
    emit(state.copyWith(recentSearches: []));
  }

  void searchFromRecent(String query) {
    searchController.text = query;
    search();
  }

  Future<void> toggleLike(String postId) async {
    final wasLiked = state.likedPostIds.contains(postId);
    final newLikedIds = Set<String>.from(state.likedPostIds);
    wasLiked ? newLikedIds.remove(postId) : newLikedIds.add(postId);

    final delta = wasLiked ? -1 : 1;
    final updatedResults = state.results.map((p) {
      if (p.postId == postId) {
        return p.copyWith(likesCount: p.likesCount + delta);
      }
      return p;
    }).toList();

    emit(state.copyWith(likedPostIds: newLikedIds, results: updatedResults));

    final result = await _repo.togglePostLike(postId);
    result.when(
      success: (_) {},
      failure: (_) {
        final revertIds = Set<String>.from(state.likedPostIds);
        wasLiked ? revertIds.add(postId) : revertIds.remove(postId);
        final revertedResults = state.results.map((p) {
          if (p.postId == postId) {
            return p.copyWith(likesCount: p.likesCount - delta);
          }
          return p;
        }).toList();
        emit(state.copyWith(
          likedPostIds: revertIds,
          results: revertedResults,
        ));
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

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
