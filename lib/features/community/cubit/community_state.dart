import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/post_model.dart';

part 'community_state.freezed.dart';

@freezed
abstract class CommunityState with _$CommunityState {
  const factory CommunityState({
    @Default('all') String selectedCategory,
    @Default([]) List<PostModel> posts,
    @Default(false) bool isPostsLoading,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
    @Default(0) int currentPage,
    String? errorMessage,
    @Default(<String>{}) Set<String> likedPostIds,
    @Default(<String>{}) Set<String> bookmarkedPostIds,
  }) = _CommunityState;

  const CommunityState._();
}
