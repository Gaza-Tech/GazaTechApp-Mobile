import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/post_model.dart';
import '../data/models/comment_model.dart';

part 'post_details_state.freezed.dart';

@freezed
abstract class PostDetailsState with _$PostDetailsState {
  const factory PostDetailsState({
    PostModel? post,
    @Default([]) List<CommentModel> comments,
    @Default(false) bool isPostLoading,
    @Default(false) bool isCommentsLoading,
    @Default(false) bool isLoadingMoreComments,
    @Default(true) bool hasMoreComments,
    @Default(0) int commentsPage,
    String? errorMessage,
    @Default(false) bool isLiked,
    @Default(false) bool isBookmarked,
    @Default(<String>{}) Set<String> likedCommentIds,
  }) = _PostDetailsState;

  const PostDetailsState._();
}
