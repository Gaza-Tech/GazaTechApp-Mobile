import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/repos/community_repo.dart';
import 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  final CommunityRepo _repo;
  final String postId;

  PostDetailsCubit(this._repo, this.postId) : super(const PostDetailsState());

  Future<void> loadPost() async {
    emit(state.copyWith(isPostLoading: true, errorMessage: null));

    final result = await _repo.fetchPostDetails(postId);
    result.when(
      success: (post) => emit(
        state.copyWith(
          isPostLoading: false,
          post: post,
          isLiked: post.isLiked,
          isBookmarked: post.isBookmarked,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(isPostLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> loadComments() async {
    emit(
      state.copyWith(isCommentsLoading: true, comments: [], commentsPage: 0),
    );

    final result = await _repo.fetchComments(postId: postId, page: 0);
    result.when(
      success: (response) => emit(
        state.copyWith(
          isCommentsLoading: false,
          comments: response.comments,
          hasMoreComments: response.hasMore,
          commentsPage: 1,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(isCommentsLoading: false, errorMessage: error.message),
      ),
    );
  }

  Future<void> loadMoreComments() async {
    if (state.isLoadingMoreComments || !state.hasMoreComments) return;

    emit(state.copyWith(isLoadingMoreComments: true));

    final result = await _repo.fetchComments(
      postId: postId,
      page: state.commentsPage,
    );
    result.when(
      success: (response) => emit(
        state.copyWith(
          isLoadingMoreComments: false,
          comments: [...state.comments, ...response.comments],
          hasMoreComments: response.hasMore,
          commentsPage: state.commentsPage + 1,
        ),
      ),
      failure: (error) => emit(
        state.copyWith(
          isLoadingMoreComments: false,
          errorMessage: error.message,
        ),
      ),
    );
  }

  Future<void> togglePostLike() async {
    final wasLiked = state.isLiked;
    emit(state.copyWith(isLiked: !wasLiked));

    final result = await _repo.togglePostLike(postId);
    result.when(
      success: (_) {},
      failure: (_) => emit(state.copyWith(isLiked: wasLiked)),
    );
  }

  Future<void> toggleBookmark() async {
    final wasBookmarked = state.isBookmarked;
    emit(state.copyWith(isBookmarked: !wasBookmarked));

    final result = await _repo.toggleBookmark(postId);
    result.when(
      success: (_) {},
      failure: (_) => emit(state.copyWith(isBookmarked: wasBookmarked)),
    );
  }

  Future<void> toggleCommentLike(String commentId) async {
    final wasLiked = state.likedCommentIds.contains(commentId);
    final newIds = Set<String>.from(state.likedCommentIds);
    wasLiked ? newIds.remove(commentId) : newIds.add(commentId);
    emit(state.copyWith(likedCommentIds: newIds));

    final result = await _repo.toggleCommentLike(commentId);
    result.when(
      success: (_) {},
      failure: (_) {
        final revertIds = Set<String>.from(state.likedCommentIds);
        wasLiked ? revertIds.add(commentId) : revertIds.remove(commentId);
        emit(state.copyWith(likedCommentIds: revertIds));
      },
    );
  }

  Future<void> addComment(String content) async {
    if (content.trim().isEmpty) return;

    final result = await _repo.addComment(
      postId: postId,
      content: content.trim(),
    );
    result.when(
      success: (_) => loadComments(),
      failure: (error) => emit(state.copyWith(errorMessage: error.message)),
    );
  }
}
