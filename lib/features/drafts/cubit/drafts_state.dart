import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gaza_tech/features/community/data/models/post_model.dart';
import 'package:gaza_tech/features/listing_details/data/models/listing_detail_model.dart';

part 'drafts_state.freezed.dart';

@freezed
abstract class DraftsState with _$DraftsState {
  const factory DraftsState({
    // Posts tab
    @Default([]) List<PostModel> posts,
    @Default(0) int postsPage,
    @Default(true) bool postsHasMore,
    @Default(false) bool isPostsLoading,
    @Default(false) bool isPostsLoadingMore,

    // Listings tab
    @Default([]) List<ListingDetailModel> listings,
    @Default(0) int listingsPage,
    @Default(true) bool listingsHasMore,
    @Default(false) bool isListingsLoading,
    @Default(false) bool isListingsLoadingMore,

    String? errorMessage,
  }) = _DraftsState;
}
