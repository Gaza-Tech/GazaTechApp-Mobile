import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/community/data/models/post_model.dart';
import 'package:gaza_tech/features/community_search/data/models/search_filter.dart';

part 'community_search_state.freezed.dart';

@freezed
abstract class CommunitySearchState with _$CommunitySearchState {
  const factory CommunitySearchState({
    @Default('') String keyword,
    @Default([]) List<PostModel> results,
    @Default(0) int currentPage,
    @Default(true) bool hasMore,
    @Default(false) bool isSearching,
    @Default(false) bool isLoadingMore,
    @Default([]) List<String> recentSearches,
    String? errorMessage,
    @Default(<String>{}) Set<String> likedPostIds,
    @Default(<String>{}) Set<String> bookmarkedPostIds,
    @Default(SearchFilter()) SearchFilter filter,
  }) = _CommunitySearchState;

  const CommunitySearchState._();

  bool get hasResults => results.isNotEmpty;
  bool get isEmpty =>
      keyword.isNotEmpty &&
      !isSearching &&
      results.isEmpty &&
      errorMessage == null;
  bool get isInitial => keyword.isEmpty;
  bool get hasError => errorMessage != null;
}
