import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/bookmarks/cubit/bookmarks_cubit.dart';
import 'package:gaza_tech/features/bookmarks/cubit/bookmarks_state.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card.dart';
import 'package:gaza_tech/l10n/app_localizations.dart';

class BookmarkedPostsTab extends StatefulWidget {
  const BookmarkedPostsTab({super.key});

  @override
  State<BookmarkedPostsTab> createState() => _BookmarkedPostsTabState();
}

class _BookmarkedPostsTabState extends State<BookmarkedPostsTab>
    with AutomaticKeepAliveClientMixin {
  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        notification.metrics.extentAfter == 0) {
      context.read<BookmarksCubit>().fetchMoreBookmarkedPosts();
    }
    return false;
  }

  String _timeAgo(AppLocalizations l10n, DateTime createdAt) {
    final diff = DateTime.now().difference(createdAt);
    if (diff.inDays >= 2) return l10n.daysAgo(diff.inDays);
    if (diff.inDays == 1) return l10n.dayAgo;
    return l10n.hoursAgo(diff.inHours.clamp(1, 23));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<BookmarksCubit, BookmarksState>(
      builder: (context, state) {
        if (state.isPostsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.bookmarkedPosts.isEmpty) {
          return Center(child: Text(context.l10n.noBookmarksYet));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                sliver: SliverList.separated(
                  separatorBuilder: (_, _) => const SizedBox.shrink(),
                  itemCount: state.bookmarkedPosts.length,
                  itemBuilder: (context, index) {
                    final post = state.bookmarkedPosts[index];
                    final cubit = context.read<BookmarksCubit>();
                    return PostCard(
                      userName: post.authorIsActive
                          ? post.authorName
                          : context.l10n.deletedUser,
                      timeAgo: _timeAgo(context.l10n, post.createdAt),
                      category: post.postCategory,
                      title: post.title,
                      description: post.content,
                      attachmentUrls: post.attachmentUrls,
                      likes: post.likesCount,
                      comments: post.commentsCount,
                      isVerified:
                          post.authorIsActive &&
                          (post.author?.isVerified ?? false),
                      isLiked: state.likedPostIds.contains(post.postId),
                      isBookmarked: state.bookmarkedPostIds.contains(
                        post.postId,
                      ),
                      onLikeToggle: () => cubit.togglePostLike(post.postId),
                      onBookmarkToggle: () =>
                          cubit.togglePostBookmark(post.postId),
                      onTap: () => Navigator.pushNamed(
                        context,
                        MyRoutes.postDetails,
                        arguments: post.postId,
                      ),
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
