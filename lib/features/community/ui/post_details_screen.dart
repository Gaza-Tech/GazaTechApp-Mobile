import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/helpers/guest_guard.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/delete_confirmation_sheet.dart';
import 'package:gaza_tech/features/community/cubit/post_details_cubit.dart';
import 'package:gaza_tech/features/community/cubit/post_details_state.dart';
import 'package:gaza_tech/features/community/data/models/comment_model.dart';
import 'package:gaza_tech/features/community/ui/widgets/comment_card.dart';
import 'package:gaza_tech/features/community/ui/widgets/comment_input_bar.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_actions.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_header.dart';
import 'package:gaza_tech/features/community/ui/widgets/fullscreen_image_viewer.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_image_gallery.dart';
import 'package:gaza_tech/features/community/ui/widgets/view_replies_button.dart';
import 'package:gaza_tech/features/report/data/models/report_reason.dart';
import 'package:gaza_tech/features/report/ui/widgets/report_bottom_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  String? _replyingTo;
  String? _replyingToCommentId;
  String? _editingCommentId;
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _startEditComment(CommentModel comment, String? parentCommentId) {
    setState(() {
      _editingCommentId = comment.commentId;
      _replyingTo = null;
      _replyingToCommentId = null;
    });
    _commentController.text = comment.content;
  }

  void _cancelEdit() {
    setState(() {
      _editingCommentId = null;
    });
    _commentController.clear();
  }

  void _showDeleteCommentConfirmation(
    BuildContext context,
    CommentModel comment,
    String? parentCommentId,
  ) {
    final l10n = context.l10n;
    showDeleteConfirmationSheet(
      context,
      title: l10n.deleteCommentConfirmTitle,
      body: l10n.deleteCommentConfirmBody,
      onConfirm: () => _deleteComment(context, comment, parentCommentId),
    );
  }

  Future<void> _deleteComment(
    BuildContext context,
    CommentModel comment,
    String? parentCommentId,
  ) async {
    final l10n = context.l10n;
    final error = await context.read<PostDetailsCubit>().deleteComment(
      comment.commentId,
      parentCommentId: parentCommentId,
    );
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(error ?? l10n.commentDeleted)));
  }

  Future<void> _submitComment(BuildContext context) async {
    if (!await GuestGuard.requireAccount(context)) return;
    if (!context.mounted) return;
    final cubit = context.read<PostDetailsCubit>();
    final l10n = context.l10n;
    final text = _commentController.text;

    if (_editingCommentId != null) {
      final error = await cubit.updateComment(_editingCommentId!, text);
      if (!context.mounted) return;
      if (error == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.commentUpdated)));
        setState(() {
          _editingCommentId = null;
        });
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error)));
      }
    } else {
      cubit.addComment(text, parentCommentId: _replyingToCommentId);
      setState(() {
        _replyingTo = null;
        _replyingToCommentId = null;
      });
    }
    _commentController.clear();
    FocusScope.of(context).unfocus();
  }

  Future<void> _navigateToEdit(
    BuildContext context,
    PostDetailsState state,
  ) async {
    final post = state.post;
    if (post == null) return;
    final result = await Navigator.pushNamed(
      context,
      MyRoutes.editPost,
      arguments: post,
    );
    if (result == true && context.mounted) {
      context.read<PostDetailsCubit>().loadPost();
    }
  }

  void _showDeleteConfirmation(BuildContext context) {
    final l10n = context.l10n;
    showDeleteConfirmationSheet(
      context,
      title: l10n.deletePostConfirmTitle,
      body: l10n.deletePostConfirmBody,
      onConfirm: () => _deletePost(context),
    );
  }

  Future<void> _deletePost(BuildContext context) async {
    final l10n = context.l10n;
    final error = await context.read<PostDetailsCubit>().deletePost();
    if (!context.mounted) return;

    if (error == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.postDeleted)));
      Navigator.pop(context, 'deleted');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error)));
    }
  }

  String _timeAgo(BuildContext context, DateTime createdAt) {
    final l10n = context.l10n;
    final diff = DateTime.now().difference(createdAt);
    if (diff.inDays >= 2) return l10n.daysAgo(diff.inDays);
    if (diff.inDays == 1) return l10n.dayAgo;
    return l10n.hoursAgo(diff.inHours.clamp(1, 23));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return BlocBuilder<PostDetailsCubit, PostDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.postDetails),
            actions: [
              if (state.post != null) ...[
                if (state.post!.authorId ==
                    Supabase.instance.client.auth.currentUser?.id) ...[
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => _navigateToEdit(context, state),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outlined),
                    onPressed: () => _showDeleteConfirmation(context),
                  ),
                ],
                IconButton(
                  icon: const Icon(Icons.share_rounded),
                  onPressed: () {},
                ),
                if (state.post!.authorId !=
                    Supabase.instance.client.auth.currentUser?.id)
                  IconButton(
                    icon: Icon(
                      state.isReported
                          ? Icons.flag_rounded
                          : Icons.outlined_flag_rounded,
                    ),
                    onPressed: state.isReported
                        ? null
                        : () async {
                            if (!await GuestGuard.requireAccount(context)) {
                              return;
                            }
                            if (!context.mounted) return;
                            final reported = await showReportBottomSheet(
                              context,
                              entityType: ReportEntityType.post,
                              entityId: state.post!.postId,
                            );
                            if (reported == true && context.mounted) {
                              context
                                  .read<PostDetailsCubit>()
                                  .markPostAsReported();
                            }
                          },
                  ),
                SizedBox(width: 4.w),
              ],
            ],
          ),
          body: state.isPostLoading
              ? const Center(child: CircularProgressIndicator())
              : state.post == null
              ? Center(child: Text(state.errorMessage ?? l10n.noResultsFound))
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.h),
                            _buildAuthorSection(context, state, theme),
                            SizedBox(height: 14.h),
                            _buildPostContent(state, theme),
                            if (state.post!.attachmentUrls.isNotEmpty) ...[
                              SizedBox(height: 14.h),
                              PostImageGallery(
                                imageUrls: state.post!.attachmentUrls,
                                onImageTap: (index) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => FullscreenImageViewer(
                                      imageUrls: state.post!.attachmentUrls,
                                      initialIndex: index,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            SizedBox(height: 14.h),
                            _buildActions(context, state),
                            Divider(height: 28.h),
                            _buildCommentsHeader(state, theme, l10n),
                            SizedBox(height: 16.h),
                            if (state.isCommentsLoading)
                              const Center(child: CircularProgressIndicator())
                            else
                              ...state.comments.expand((comment) {
                                final cubit = context.read<PostDetailsCubit>();
                                final currentUserId = Supabase
                                    .instance
                                    .client
                                    .auth
                                    .currentUser
                                    ?.id;
                                final isOwn = comment.authorId == currentUserId;
                                return [
                                  CommentCard(
                                    userName: comment.authorName,
                                    timeAgo: _timeAgo(
                                      context,
                                      comment.createdAt,
                                    ),
                                    text: comment.content,
                                    likes: comment.likesCount,
                                    isLiked: state.likedCommentIds.contains(
                                      comment.commentId,
                                    ),
                                    isReported: state.reportedCommentIds
                                        .contains(comment.commentId),
                                    isEdited: comment.isEdited,
                                    indentLevel: 0,
                                    onReply: () => setState(() {
                                      _replyingTo = comment.authorName;
                                      _replyingToCommentId = comment.commentId;
                                    }),
                                    onLikeTap: () async {
                                      if (!await GuestGuard.requireAccount(
                                        context,
                                      )) {
                                        return;
                                      }
                                      cubit.toggleCommentLike(
                                        comment.commentId,
                                      );
                                    },
                                    onEdit: isOwn
                                        ? () => _startEditComment(comment, null)
                                        : null,
                                    onDelete: isOwn
                                        ? () => _showDeleteCommentConfirmation(
                                            context,
                                            comment,
                                            null,
                                          )
                                        : null,
                                    onReport: !isOwn
                                        ? () async {
                                            if (!await GuestGuard.requireAccount(
                                              context,
                                            )) {
                                              return;
                                            }
                                            if (!context.mounted) return;
                                            final reported =
                                                await showReportBottomSheet(
                                                  context,
                                                  entityType:
                                                      ReportEntityType.comment,
                                                  entityId: comment.commentId,
                                                );
                                            if (reported == true &&
                                                context.mounted) {
                                              cubit.markCommentAsReported(
                                                comment.commentId,
                                              );
                                            }
                                          }
                                        : null,
                                  ),
                                  if (comment.repliesCount > 0)
                                    ViewRepliesButton(
                                      repliesCount: comment.repliesCount,
                                      isExpanded: state.expandedCommentIds
                                          .contains(comment.commentId),
                                      isLoading: state.loadingReplyIds.contains(
                                        comment.commentId,
                                      ),
                                      onTap: () => cubit.toggleRepliesExpansion(
                                        comment.commentId,
                                      ),
                                    ),
                                  if (state.expandedCommentIds.contains(
                                    comment.commentId,
                                  ))
                                    ...(state.repliesByCommentId[comment
                                                .commentId] ??
                                            [])
                                        .map((reply) {
                                          final isOwnReply =
                                              reply.authorId == currentUserId;
                                          return CommentCard(
                                            userName: reply.authorName,
                                            timeAgo: _timeAgo(
                                              context,
                                              reply.createdAt,
                                            ),
                                            text: reply.content,
                                            likes: reply.likesCount,
                                            isLiked: state.likedCommentIds
                                                .contains(reply.commentId),
                                            isReported: state.reportedCommentIds
                                                .contains(reply.commentId),
                                            isEdited: reply.isEdited,
                                            indentLevel: 1,
                                            onLikeTap: () async {
                                              if (!await GuestGuard.requireAccount(
                                                context,
                                              )) {
                                                return;
                                              }
                                              cubit.toggleCommentLike(
                                                reply.commentId,
                                              );
                                            },
                                            onEdit: isOwnReply
                                                ? () => _startEditComment(
                                                    reply,
                                                    comment.commentId,
                                                  )
                                                : null,
                                            onDelete: isOwnReply
                                                ? () =>
                                                      _showDeleteCommentConfirmation(
                                                        context,
                                                        reply,
                                                        comment.commentId,
                                                      )
                                                : null,
                                            onReport: !isOwnReply
                                                ? () async {
                                                    if (!await GuestGuard
                                                        .requireAccount(
                                                          context,
                                                        )) {
                                                      return;
                                                    }
                                                    if (!context.mounted) {
                                                      return;
                                                    }
                                                    final reported =
                                                        await showReportBottomSheet(
                                                          context,
                                                          entityType:
                                                              ReportEntityType
                                                                  .comment,
                                                          entityId:
                                                              reply.commentId,
                                                        );
                                                    if (reported == true &&
                                                        context.mounted) {
                                                      cubit
                                                          .markCommentAsReported(
                                                            reply.commentId,
                                                          );
                                                    }
                                                  }
                                                : null,
                                          );
                                        }),
                                ];
                              }),
                            if (state.hasMoreComments &&
                                !state.isCommentsLoading)
                              _buildLoadMoreButton(context, state, theme, l10n),
                            SizedBox(height: 32.h),
                          ],
                        ),
                      ),
                    ),
                    CommentInputBar(
                      controller: _commentController,
                      replyingTo: _replyingTo,
                      onDismissReply: () => setState(() {
                        _replyingTo = null;
                        _replyingToCommentId = null;
                      }),
                      isEditing: _editingCommentId != null,
                      onCancelEdit: _cancelEdit,
                      onSubmit: () => _submitComment(context),
                      isGuest: GuestGuard.isGuest,
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildAuthorSection(
    BuildContext context,
    PostDetailsState state,
    ThemeData theme,
  ) {
    final post = state.post!;
    return PostCardHeader(
      userName: post.authorName,
      timeAgo: _timeAgo(context, post.createdAt),
      category: post.postCategory,
    );
  }

  Widget _buildPostContent(PostDetailsState state, ThemeData theme) {
    final post = state.post!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: MyTextStyle.heading.h2.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          post.content,
          style: MyTextStyle.body.m.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context, PostDetailsState state) {
    final post = state.post!;
    return PostCardActions(
      likes: post.likesCount,
      comments: post.commentsCount,
      isLiked: state.isLiked,
      isBookmarked: state.isBookmarked,
      onLikeToggle: () async {
        if (!await GuestGuard.requireAccount(context)) return;
        if (!context.mounted) return;
        context.read<PostDetailsCubit>().togglePostLike();
      },
      onBookmarkToggle: () async {
        if (!await GuestGuard.requireAccount(context)) return;
        if (!context.mounted) return;
        context.read<PostDetailsCubit>().toggleBookmark();
      },
    );
  }

  Widget _buildCommentsHeader(
    PostDetailsState state,
    ThemeData theme,
    dynamic l10n,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          l10n.commentsCount(state.post!.commentsCount),
          style: MyTextStyle.heading.h3.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        Row(
          children: [
            Text(
              l10n.topSort,
              style: MyTextStyle.action.m.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 20.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoadMoreButton(
    BuildContext context,
    PostDetailsState state,
    ThemeData theme,
    dynamic l10n,
  ) {
    return Center(
      child: state.isLoadingMoreComments
          ? const CircularProgressIndicator()
          : TextButton(
              onPressed: () =>
                  context.read<PostDetailsCubit>().loadMoreComments(),
              child: Text(
                l10n.loadMoreComments,
                style: MyTextStyle.action.m.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
    );
  }
}
