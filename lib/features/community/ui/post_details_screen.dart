import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/community/cubit/post_details_cubit.dart';
import 'package:gaza_tech/features/community/cubit/post_details_state.dart';
import 'package:gaza_tech/features/community/ui/widgets/comment_card.dart';
import 'package:gaza_tech/features/community/ui/widgets/comment_input_bar.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_actions.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card_header.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_image_gallery.dart';
import 'package:gaza_tech/features/community/ui/widgets/view_replies_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  String? _replyingTo;
  String? _replyingToCommentId;
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
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
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (bottomSheetContext) {
        return Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: theme.dividerColor,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              const VerticalSpace(24),
              Icon(
                Icons.delete_outline,
                size: 48.sp,
                color: theme.colorScheme.error,
              ),
              const VerticalSpace(16),
              Text(
                l10n.deletePostConfirmTitle,
                style: theme.textTheme.titleLarge,
              ),
              const VerticalSpace(8),
              Text(
                l10n.deletePostConfirmBody,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              const VerticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(bottomSheetContext),
                      child: Text(l10n.cancel),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.error,
                        foregroundColor: theme.colorScheme.onError,
                      ),
                      onPressed: () {
                        Navigator.pop(bottomSheetContext);
                        _deletePost(context);
                      },
                      child: Text(l10n.delete),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );
  }

  Future<void> _deletePost(BuildContext context) async {
    final l10n = context.l10n;
    final success = await context.read<PostDetailsCubit>().deletePost();
    if (!context.mounted) return;

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.postDeleted)));
      Navigator.pop(context, 'deleted');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.deletePostConfirmBody)),
      );
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
              if (state.post != null &&
                  state.post!.authorId ==
                      Supabase.instance.client.auth.currentUser?.id)
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value == 'edit') _navigateToEdit(context, state);
                    if (value == 'delete') {
                      _showDeleteConfirmation(context);
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          const Icon(Icons.edit_outlined, size: 20),
                          SizedBox(width: 8.w),
                          Text(l10n.edit),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outlined,
                            size: 20,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            l10n.delete,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                                imageCount: state.post!.attachmentUrls.length,
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
                                    indentLevel: 0,
                                    onReply: () => setState(() {
                                      _replyingTo = comment.authorName;
                                      _replyingToCommentId = comment.commentId;
                                    }),
                                    onLikeTap: () => cubit.toggleCommentLike(
                                      comment.commentId,
                                    ),
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
                                        .map(
                                          (reply) => CommentCard(
                                            userName: reply.authorName,
                                            timeAgo: _timeAgo(
                                              context,
                                              reply.createdAt,
                                            ),
                                            text: reply.content,
                                            likes: reply.likesCount,
                                            isLiked: state.likedCommentIds
                                                .contains(reply.commentId),
                                            indentLevel: 1,
                                            onLikeTap: () =>
                                                cubit.toggleCommentLike(
                                                  reply.commentId,
                                                ),
                                          ),
                                        ),
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
                      onSubmit: () {
                        context.read<PostDetailsCubit>().addComment(
                          _commentController.text,
                          parentCommentId: _replyingToCommentId,
                        );
                        _commentController.clear();
                        setState(() {
                          _replyingTo = null;
                          _replyingToCommentId = null;
                        });
                        FocusScope.of(context).unfocus();
                      },
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
    return Row(
      children: [
        Expanded(
          child: PostCardHeader(
            userName: post.authorName,
            timeAgo: _timeAgo(context, post.createdAt),
            category: post.postCategory,
          ),
        ),
        if (post.authorId ==
            Supabase.instance.client.auth.currentUser?.id)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_horiz),
            constraints: BoxConstraints(minWidth: 36.w, minHeight: 36.h),
            padding: EdgeInsets.zero,
            onSelected: (value) {
              if (value == 'edit') _navigateToEdit(context, state);
              if (value == 'delete') _showDeleteConfirmation(context);
            },
            itemBuilder: (_) {
              final l10n = context.l10n;
              return [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      const Icon(Icons.edit_outlined, size: 20),
                      SizedBox(width: 8.w),
                      Text(l10n.edit),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_outlined,
                        size: 20,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        l10n.delete,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
      ],
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
      onLikeToggle: () => context.read<PostDetailsCubit>().togglePostLike(),
      onBookmarkToggle: () => context.read<PostDetailsCubit>().toggleBookmark(),
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
