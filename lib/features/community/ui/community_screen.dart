import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/community/cubit/community_cubit.dart';
import 'package:gaza_tech/features/community/cubit/community_state.dart';
import 'package:gaza_tech/features/community/ui/widgets/community_category_chips.dart';
import 'package:gaza_tech/features/community/ui/widgets/community_search_bar.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card.dart';

class CommunityScreen extends StatefulWidget {
  final ScrollController scrollController;

  const CommunityScreen({super.key, required this.scrollController});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  static const _categoryValues = [
    'all',
    'questions',
    'tips',
    'news',
    'troubleshooting',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cubitState = context.read<CommunityCubit>().state;
    if (cubitState.posts.isEmpty && !cubitState.isPostsLoading) {
      context.read<CommunityCubit>().fetchPosts();
    }
  }

  String _categoryLabel(BuildContext context, String category) {
    final l10n = context.l10n;
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

  String _timeAgo(BuildContext context, DateTime createdAt) {
    final l10n = context.l10n;
    final diff = DateTime.now().difference(createdAt);
    if (diff.inDays >= 2) return l10n.daysAgo(diff.inDays);
    if (diff.inDays == 1) return l10n.dayAgo;
    return l10n.hoursAgo(diff.inHours.clamp(1, 23));
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      context.l10n.categoryAll,
      context.l10n.questions,
      context.l10n.tips,
      context.l10n.news,
      context.l10n.troubleshooting,
    ];

    return BlocBuilder<CommunityCubit, CommunityState>(
      builder: (context, state) {
        final selectedIndex = _categoryValues.indexOf(state.selectedCategory);

        return CustomScrollView(
          controller: widget.scrollController,
          slivers: [
            SliverAppBar(
              title: Text(context.l10n.community),
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.person_outline, size: 26.sp),
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: const CommunitySearchBar(),
                  ),
                  SizedBox(height: 4.h),
                  CommunityCategoryChips(
                    categories: categories,
                    selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
                    onCategoryChanged: (index) {
                      context
                          .read<CommunityCubit>()
                          .changeCategory(_categoryValues[index]);
                    },
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
            if (state.isPostsLoading)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (state.errorMessage != null)
              SliverFillRemaining(
                child: Center(child: Text(state.errorMessage!)),
              )
            else if (state.posts.isEmpty)
              SliverFillRemaining(
                child: Center(child: Text(context.l10n.noResultsFound)),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == state.posts.length) {
                      if (state.isLoadingMore) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (state.hasMore) {
                        context.read<CommunityCubit>().fetchMorePosts();
                      }
                      return const SizedBox.shrink();
                    }

                    final post = state.posts[index];
                    return PostCard(
                      userName: post.authorName,
                      timeAgo: _timeAgo(context, post.createdAt),
                      category: _categoryLabel(context, post.postCategory),
                      title: post.title,
                      description: post.content,
                      likes: post.likesCount,
                      comments: post.commentsCount,
                      isLiked: state.likedPostIds.contains(post.postId),
                      isBookmarked:
                          state.bookmarkedPostIds.contains(post.postId),
                      onLikeToggle: () =>
                          context.read<CommunityCubit>().toggleLike(post.postId),
                      onBookmarkToggle: () => context
                          .read<CommunityCubit>()
                          .toggleBookmark(post.postId),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MyRoutes.postDetails,
                          arguments: post.postId,
                        );
                      },
                    );
                  },
                  childCount: state.posts.length + (state.hasMore ? 1 : 0),
                ),
              ),
            SliverToBoxAdapter(child: SizedBox(height: 100.h)),
          ],
        );
      },
    );
  }
}
