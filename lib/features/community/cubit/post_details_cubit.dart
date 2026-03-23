import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/netowoks/api_result.dart';
import '../data/models/comment_model.dart';
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
      state.copyWith(
        isCommentsLoading: true,
        comments: [],
        commentsPage: 0,
        repliesByCommentId: {},
        expandedCommentIds: {},
        loadingReplyIds: {},
      ),
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
    final delta = wasLiked ? -1 : 1;
    emit(
      state.copyWith(
        isLiked: !wasLiked,
        post: state.post?.copyWith(likesCount: state.post!.likesCount + delta),
      ),
    );

    final result = await _repo.togglePostLike(postId);
    result.when(
      success: (_) {},
      failure: (_) => emit(
        state.copyWith(
          isLiked: wasLiked,
          post: state.post?.copyWith(
            likesCount: state.post!.likesCount - delta,
          ),
        ),
      ),
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
    final delta = wasLiked ? -1 : 1;

    final newIds = Set<String>.from(state.likedCommentIds);
    wasLiked ? newIds.remove(commentId) : newIds.add(commentId);
    emit(
      state.copyWith(
        likedCommentIds: newIds,
        comments: _patchLikesCount(state.comments, commentId, delta),
        repliesByCommentId: _patchRepliesLikesCount(
          state.repliesByCommentId,
          commentId,
          delta,
        ),
      ),
    );

    final result = await _repo.toggleCommentLike(commentId);
    result.when(
      success: (_) {},
      failure: (_) {
        final revertIds = Set<String>.from(state.likedCommentIds);
        wasLiked ? revertIds.add(commentId) : revertIds.remove(commentId);
        emit(
          state.copyWith(
            likedCommentIds: revertIds,
            comments: _patchLikesCount(state.comments, commentId, -delta),
            repliesByCommentId: _patchRepliesLikesCount(
              state.repliesByCommentId,
              commentId,
              -delta,
            ),
          ),
        );
      },
    );
  }

  List<CommentModel> _patchLikesCount(
    List<CommentModel> comments,
    String commentId,
    int delta,
  ) {
    return comments
        .map(
          (c) => c.commentId == commentId
              ? c.copyWith(likesCount: c.likesCount + delta)
              : c,
        )
        .toList();
  }

  Map<String, List<CommentModel>> _patchRepliesLikesCount(
    Map<String, List<CommentModel>> repliesByCommentId,
    String commentId,
    int delta,
  ) {
    return repliesByCommentId.map(
      (parentId, replies) =>
          MapEntry(parentId, _patchLikesCount(replies, commentId, delta)),
    );
  }

  Future<void> toggleRepliesExpansion(String commentId) async {
    if (state.expandedCommentIds.contains(commentId)) {
      final newExpanded = Set<String>.from(state.expandedCommentIds)
        ..remove(commentId);
      emit(state.copyWith(expandedCommentIds: newExpanded));
      return;
    }

    if (state.repliesByCommentId.containsKey(commentId)) {
      final newExpanded = Set<String>.from(state.expandedCommentIds)
        ..add(commentId);
      emit(state.copyWith(expandedCommentIds: newExpanded));
      return;
    }

    final newLoading = Set<String>.from(state.loadingReplyIds)..add(commentId);
    emit(state.copyWith(loadingReplyIds: newLoading));

    final result = await _repo.fetchReplies(parentCommentId: commentId);
    result.when(
      success: (replies) {
        final newReplies = Map<String, List<CommentModel>>.from(
          state.repliesByCommentId,
        )..[commentId] = replies;
        final newExpanded = Set<String>.from(state.expandedCommentIds)
          ..add(commentId);
        final newLoadingDone = Set<String>.from(state.loadingReplyIds)
          ..remove(commentId);
        emit(
          state.copyWith(
            repliesByCommentId: newReplies,
            expandedCommentIds: newExpanded,
            loadingReplyIds: newLoadingDone,
          ),
        );
      },
      failure: (_) {
        final newLoadingDone = Set<String>.from(state.loadingReplyIds)
          ..remove(commentId);
        emit(state.copyWith(loadingReplyIds: newLoadingDone));
      },
    );
  }

  Future<void> _refreshReplies(String parentCommentId) async {
    final result = await _repo.fetchReplies(parentCommentId: parentCommentId);
    result.when(
      success: (replies) {
        final newReplies = Map<String, List<CommentModel>>.from(
          state.repliesByCommentId,
        )..[parentCommentId] = replies;
        final newExpanded = Set<String>.from(state.expandedCommentIds)
          ..add(parentCommentId);
        emit(
          state.copyWith(
            repliesByCommentId: newReplies,
            expandedCommentIds: newExpanded,
          ),
        );
      },
      failure: (_) {},
    );
  }

  void _incrementParentReplyCount(String parentCommentId) {
    final updatedComments = state.comments.map((c) {
      if (c.commentId == parentCommentId) {
        return c.copyWith(repliesCount: c.repliesCount + 1);
      }
      return c;
    }).toList();
    emit(state.copyWith(comments: updatedComments));
  }

  Future<void> addComment(String content, {String? parentCommentId}) async {
    if (content.trim().isEmpty) return;

    final result = await _repo.addComment(
      postId: postId,
      content: content.trim(),
      parentCommentId: parentCommentId,
    );
    result.when(
      success: (_) {
        if (state.post != null) {
          emit(
            state.copyWith(
              post: state.post!.copyWith(
                commentsCount: state.post!.commentsCount + 1,
              ),
            ),
          );
        }
        if (parentCommentId != null) {
          _incrementParentReplyCount(parentCommentId);
          _refreshReplies(parentCommentId);
        } else {
          loadComments();
        }
      },
      failure: (error) => emit(state.copyWith(errorMessage: error.message)),
    );
  }
}
