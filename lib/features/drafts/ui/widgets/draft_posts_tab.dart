import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/widgets/confirmation_sheet.dart';
import 'package:gaza_tech/core/widgets/delete_confirmation_sheet.dart';
import 'package:gaza_tech/features/community/data/models/post_model.dart';
import 'package:gaza_tech/features/drafts/cubit/drafts_cubit.dart';
import 'package:gaza_tech/features/drafts/cubit/drafts_state.dart';
import 'package:gaza_tech/features/drafts/ui/widgets/draft_post_card.dart';
import 'package:gaza_tech/l10n/app_localizations.dart';

class DraftPostsTab extends StatefulWidget {
  const DraftPostsTab({super.key});

  @override
  State<DraftPostsTab> createState() => _DraftPostsTabState();
}

class _DraftPostsTabState extends State<DraftPostsTab>
    with AutomaticKeepAliveClientMixin {
  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        notification.metrics.extentAfter == 0) {
      context.read<DraftsCubit>().fetchMorePostDrafts();
    }
    return false;
  }

  String _timeAgo(AppLocalizations l10n, DateTime createdAt) {
    final diff = DateTime.now().difference(createdAt);
    if (diff.inDays >= 2) return l10n.daysAgo(diff.inDays);
    if (diff.inDays == 1) return l10n.dayAgo;
    return l10n.hoursAgo(diff.inHours.clamp(1, 23));
  }

  Future<void> _navigateToEdit(BuildContext context, PostModel post) async {
    final result = await Navigator.pushNamed(
      context,
      MyRoutes.editPost,
      arguments: post,
    );
    if (!context.mounted) return;
    if (result == true) {
      context.read<DraftsCubit>().fetchPostDrafts();
    }
  }

  void _showDeleteConfirmation(BuildContext context, String postId) {
    final l10n = context.l10n;
    showDeleteConfirmationSheet(
      context,
      title: l10n.deletePostConfirmTitle,
      body: l10n.deletePostConfirmBody,
      onConfirm: () async {
        final success = await context.read<DraftsCubit>().deletePostDraft(
          postId,
        );
        if (success && context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.postDeleted)));
        }
      },
    );
  }

  void _showPublishConfirmation(BuildContext context, String postId) {
    final l10n = context.l10n;
    showConfirmationSheet(
      context,
      title: l10n.publishConfirmTitle,
      body: l10n.publishConfirmBody,
      confirmLabel: l10n.publish,
      onConfirm: () async {
        final success = await context.read<DraftsCubit>().publishPostDraft(
          postId,
        );
        if (success && context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.published)));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<DraftsCubit, DraftsState>(
      builder: (context, state) {
        if (state.isPostsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.posts.isEmpty) {
          return Center(child: Text(context.l10n.noDraftsYet));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                sliver: SliverList.separated(
                  separatorBuilder: (_, _s) => const SizedBox.shrink(),
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return DraftPostCard(
                      title: post.title,
                      content: post.content,
                      category: post.postCategory,
                      authorName: post.authorName,
                      timeAgo: _timeAgo(context.l10n, post.createdAt),
                      attachmentUrls: post.attachmentUrls,
                      onEdit: () => _navigateToEdit(context, post),
                      onDelete: () =>
                          _showDeleteConfirmation(context, post.postId),
                      onPublish: () =>
                          _showPublishConfirmation(context, post.postId),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: state.isPostsLoadingMore
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : SizedBox(height: 80.h),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
