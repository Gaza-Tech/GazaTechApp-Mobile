import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/my_text_form_field.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card.dart';
import 'package:gaza_tech/features/community_search/cubit/community_search_cubit.dart';
import 'package:gaza_tech/features/community_search/cubit/community_search_state.dart';

class CommunitySearchScreen extends StatelessWidget {
  const CommunitySearchScreen({super.key});

  String _timeAgo(BuildContext context, DateTime createdAt) {
    final l10n = context.l10n;
    final diff = DateTime.now().difference(createdAt);
    if (diff.inDays >= 2) return l10n.daysAgo(diff.inDays);
    if (diff.inDays == 1) return l10n.dayAgo;
    return l10n.hoursAgo(diff.inHours.clamp(1, 23));
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

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CommunitySearchCubit>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: MyTextFormField(
          controller: cubit.searchController,
          hintText: context.l10n.searchCommunity,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.search,
          autofocus: true,
          onFieldSubmitted: (_) => cubit.search(),
          inputTextStyle: MyTextStyle.body.m,
          hintStyle: MyTextStyle.body.m.copyWith(
            color: theme.textTheme.bodySmall?.color,
          ),
          suffixIcon: ValueListenableBuilder<TextEditingValue>(
            valueListenable: cubit.searchController,
            builder: (context, value, _) {
              if (value.text.isEmpty) return const SizedBox.shrink();
              return IconButton(
                icon: const Icon(Icons.clear, size: 20),
                onPressed: () => cubit.searchController.clear(),
              );
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.dg),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.dg),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
          fillColor: isDark
              ? theme.colorScheme.surfaceContainerHighest
              : theme.colorScheme.surfaceContainerHigh,
        ),
      ),
      body: BlocBuilder<CommunitySearchCubit, CommunitySearchState>(
        builder: (context, state) {
          if (state.isInitial) {
            return _RecentSearchesView(
              recentSearches: state.recentSearches,
              onSearchTap: cubit.searchFromRecent,
              onRemoveTap: cubit.removeRecentSearch,
              onClearAll: cubit.clearRecentSearches,
            );
          }

          if (state.isSearching) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.hasError) {
            return Center(child: Text(state.errorMessage!));
          }

          if (state.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.noCommunityResults,
                    style: MyTextStyle.body.l.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    context.l10n.noCommunityResultsSubtitle,
                    style: MyTextStyle.body.m.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  notification.metrics.extentAfter == 0) {
                cubit.loadMore();
              }
              return false;
            },
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  sliver: SliverList.separated(
                    separatorBuilder: (_, _) => const SizedBox.shrink(),
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final post = state.results[index];
                      return PostCard(
                        userName: post.authorName,
                        timeAgo: _timeAgo(context, post.createdAt),
                        category: _categoryLabel(context, post.postCategory),
                        title: post.title,
                        description: post.content,
                        likes: post.likesCount,
                        comments: post.commentsCount,
                        isLiked: state.likedPostIds.contains(post.postId),
                        isBookmarked: state.bookmarkedPostIds.contains(
                          post.postId,
                        ),
                        onLikeToggle: () => cubit.toggleLike(post.postId),
                        onBookmarkToggle: () =>
                            cubit.toggleBookmark(post.postId),
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
                  child: !state.hasMore
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: Icon(Icons.circle, size: 12)),
                        )
                      : state.isLoadingMore
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox.shrink(),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 100.h)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _RecentSearchesView extends StatelessWidget {
  final List<String> recentSearches;
  final ValueChanged<String> onSearchTap;
  final ValueChanged<String> onRemoveTap;
  final VoidCallback onClearAll;

  const _RecentSearchesView({
    required this.recentSearches,
    required this.onSearchTap,
    required this.onRemoveTap,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    if (recentSearches.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.recentSearches,
                style: MyTextStyle.body.m.copyWith(fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: onClearAll,
                child: Text(
                  context.l10n.clearRecentSearches,
                  style: MyTextStyle.body.s.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: recentSearches.length,
            itemBuilder: (context, index) {
              final query = recentSearches[index];
              return ListTile(
                leading: Icon(
                  Icons.history,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                title: Text(query, style: MyTextStyle.body.m),
                trailing: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 18,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () => onRemoveTap(query),
                ),
                onTap: () => onSearchTap(query),
              );
            },
          ),
        ),
      ],
    );
  }
}
