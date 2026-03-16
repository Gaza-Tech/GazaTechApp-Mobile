import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/community_sort.dart';
import '../data/models/post_model.dart';

part 'community_state.freezed.dart';

@freezed
abstract class CommunityState with _$CommunityState {
  const factory CommunityState({
    @Default('all') String selectedCategory,

    // Posts data per category (cached)
    @Default({}) Map<String, List<PostModel>> postsByCategory,

    // Pagination state per category
    @Default({}) Map<String, int> currentPageByCategory,
    @Default({}) Map<String, bool> hasMoreByCategory,

    // Loading states
    @Default(false) bool isInitialLoading,
    @Default(false) bool isLoadingMore,

    // Error state
    String? errorMessage,

    // Global like/bookmark state
    @Default(<String>{}) Set<String> likedPostIds,
    @Default(<String>{}) Set<String> bookmarkedPostIds,

    // Sort state
    @Default(CommunityTimeSort.newest) CommunityTimeSort timeSort,
    CommunityPopularitySort? popularitySort,
  }) = _CommunityState;

  const CommunityState._();

  // Per-category helpers
  List<PostModel> postsFor(String category) =>
      postsByCategory[category] ?? [];

  bool hasMoreFor(String category) =>
      hasMoreByCategory[category] ?? true;

  int currentPageFor(String category) =>
      currentPageByCategory[category] ?? 0;

  bool get isError => errorMessage != null;
}
