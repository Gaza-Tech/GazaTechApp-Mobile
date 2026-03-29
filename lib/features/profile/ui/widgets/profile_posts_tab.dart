import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card.dart';
import 'package:gaza_tech/features/profile/cubit/profile_cubit.dart';
import 'package:gaza_tech/features/profile/cubit/profile_state.dart';
import 'package:gaza_tech/l10n/app_localizations.dart';

class ProfilePostsTab extends StatefulWidget {
  const ProfilePostsTab({super.key});

  @override
  State<ProfilePostsTab> createState() => _ProfilePostsTabState();
}

class _ProfilePostsTabState extends State<ProfilePostsTab>
    with AutomaticKeepAliveClientMixin {
  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        notification.metrics.extentAfter == 0) {
      context.read<ProfileCubit>().fetchMorePosts();
    }
    return false;
  }

  String _timeAgo(AppLocalizations l10n, DateTime createdAt) {
    final diff = DateTime.now().difference(createdAt);
    if (diff.inDays >= 2) return l10n.daysAgo(diff.inDays);
    if (diff.inDays == 1) return l10n.dayAgo;
    return l10n.hoursAgo(diff.inHours.clamp(1, 23));
  }

  Future<void> _navigateToDetails(
    BuildContext context,
    String postId,
  ) async {
    final result = await Navigator.pushNamed(
      context,
      MyRoutes.postDetails,
      arguments: postId,
    );
    if (!context.mounted) return;
    if (result == 'deleted' || result == true) {
      context.read<ProfileCubit>().fetchPosts();
    }
  }

  void _showDeleteConfirmation(BuildContext context, String postId) {
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
                      onPressed: () async {
                        Navigator.pop(bottomSheetContext);
                        final success = await context
                            .read<ProfileCubit>()
                            .deletePost(postId);
                        if (success && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(l10n.postDeleted)),
                          );
                        }
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

  String _categoryLabel(AppLocalizations l10n, String category) {
    switch (category) {
      case 'questions':
        return l10n.questions;
      case 'tips':
        return l10n.tips;
      case 'news':
        return l10n.news;
      case 'troubleshooting':
        return l10n.troubleshooting;
      default:
        return category;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.isPostsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.posts.isEmpty) {
          return Center(child: Text(context.l10n.noPostsYet));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                sliver: SliverList.separated(
                  separatorBuilder: (_, __) => const SizedBox.shrink(),
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return PostCard(
                      userName: post.authorName,
                      timeAgo: _timeAgo(context.l10n, post.createdAt),
                      category: _categoryLabel(context.l10n, post.postCategory),
                      title: post.title,
                      description: post.content,
                      likes: post.likesCount,
                      comments: post.commentsCount,
                      isLiked: state.likedPostIds.contains(post.postId),
                      isBookmarked: state.bookmarkedPostIds.contains(
                        post.postId,
                      ),
                      onLikeToggle: () =>
                          context.read<ProfileCubit>().toggleLike(post.postId),
                      onBookmarkToggle: () => context
                          .read<ProfileCubit>()
                          .toggleBookmark(post.postId),
                      onTap: () => _navigateToDetails(context, post.postId),
                      onEdit: state.isOwnProfile
                          ? () => _navigateToDetails(context, post.postId)
                          : null,
                      onDelete: state.isOwnProfile
                          ? () => _showDeleteConfirmation(
                                context,
                                post.postId,
                              )
                          : null,
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
