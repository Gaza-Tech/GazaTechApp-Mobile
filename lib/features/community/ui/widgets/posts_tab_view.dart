import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/community/cubit/community_cubit.dart';
import 'package:gaza_tech/features/community/cubit/community_state.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card.dart';

class PostsTabView extends StatefulWidget {
  final String category;

  const PostsTabView({super.key, required this.category});

  @override
  State<PostsTabView> createState() => _PostsTabViewState();
}

class _PostsTabViewState extends State<PostsTabView>
    with AutomaticKeepAliveClientMixin {
  late final CommunityCubit _communityCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _communityCubit = context.read<CommunityCubit>();
    _communityCubit.fetchIfNeeded(widget.category);
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        notification.metrics.extentAfter == 0) {
      _communityCubit.fetchMore(widget.category);
    }
    return false;
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
    super.build(context);

    return BlocConsumer<CommunityCubit, CommunityState>(
      listener: (context, state) {
        if (state.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error_outline, color: Colors.white),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Text(
                      state.errorMessage ?? 'Something went wrong',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              duration: const Duration(seconds: 4),
            ),
          );
        }
      },
      builder: (context, state) {
        final posts = state.postsFor(widget.category);

        if (state.isInitialLoading && posts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (posts.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => _communityCubit.fetchPosts(widget.category),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Center(child: Text(context.l10n.noResultsFound)),
              ),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            if (!state.hasMoreFor(widget.category)) {
              _communityCubit.resetPagination(widget.category);
            }
            await _communityCubit.fetchPosts(widget.category);
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: _onScrollNotification,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  sliver: SliverList.separated(
                    separatorBuilder: (_, _) => const SizedBox.shrink(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
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
                            _communityCubit.toggleLike(post.postId),
                        onBookmarkToggle: () =>
                            _communityCubit.toggleBookmark(post.postId),
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
                  child: !state.hasMoreFor(widget.category)
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: Icon(Icons.circle, size: 12)),
                        )
                      : const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 100.h)),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
