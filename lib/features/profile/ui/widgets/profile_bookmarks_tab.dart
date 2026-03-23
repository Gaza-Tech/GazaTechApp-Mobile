import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card.dart';
import 'package:gaza_tech/features/profile/cubit/profile_cubit.dart';
import 'package:gaza_tech/features/profile/cubit/profile_state.dart';
import 'package:gaza_tech/l10n/app_localizations.dart';
import 'bookmarked_listings_list.dart';

class ProfileBookmarksTab extends StatefulWidget {
  const ProfileBookmarksTab({super.key});

  @override
  State<ProfileBookmarksTab> createState() => _ProfileBookmarksTabState();
}

class _ProfileBookmarksTabState extends State<ProfileBookmarksTab>
    with AutomaticKeepAliveClientMixin {
  int _selectedSegment = 0;

  bool _onPostsScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        notification.metrics.extentAfter == 0) {
      context.read<ProfileCubit>().fetchMoreBookmarkedPosts();
    }
    return false;
  }

  String _timeAgo(AppLocalizations l10n, DateTime createdAt) {
    final diff = DateTime.now().difference(createdAt);
    if (diff.inDays >= 2) return l10n.daysAgo(diff.inDays);
    if (diff.inDays == 1) return l10n.dayAgo;
    return l10n.hoursAgo(diff.inHours.clamp(1, 23));
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
    final l10n = context.l10n;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SegmentedButton<int>(
            segments: [
              ButtonSegment(value: 0, label: Text(l10n.bookmarkedPosts)),
              ButtonSegment(value: 1, label: Text(l10n.bookmarkedListings)),
            ],
            selected: {_selectedSegment},
            onSelectionChanged: (selection) =>
                setState(() => _selectedSegment = selection.first),
          ),
        ),
        Expanded(
          child: _selectedSegment == 0
              ? _buildPostsContent(context)
              : const BookmarkedListingsList(),
        ),
      ],
    );
  }

  Widget _buildPostsContent(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state.isBookmarksLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.bookmarkedPosts.isEmpty) {
          return Center(child: Text(context.l10n.noBookmarksYet));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: _onPostsScrollNotification,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                sliver: SliverList.separated(
                  separatorBuilder: (_, _) => const SizedBox.shrink(),
                  itemCount: state.bookmarkedPosts.length,
                  itemBuilder: (context, index) {
                    final post = state.bookmarkedPosts[index];
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
                child: state.isBookmarksLoadingMore
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
