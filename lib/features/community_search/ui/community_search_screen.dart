import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/helpers/guest_guard.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/active_filters_bar.dart';
import 'package:gaza_tech/core/widgets/recent_searches_view.dart';
import 'package:gaza_tech/core/widgets/search_app_bar.dart';
import 'package:gaza_tech/features/community/data/models/community_sort.dart';
import 'package:gaza_tech/features/community/ui/widgets/post_card.dart';
import 'package:gaza_tech/features/community_search/cubit/community_search_cubit.dart';
import 'package:gaza_tech/features/community_search/cubit/community_search_state.dart';
import 'package:gaza_tech/features/community_search/data/models/search_filter.dart';
import 'package:gaza_tech/features/community/ui/helpers/community_tag_helper.dart';
import 'package:gaza_tech/features/community_search/ui/widgets/search_filter_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommunitySearchScreen extends StatelessWidget {
  const CommunitySearchScreen({super.key});

  String _timeAgo(BuildContext context, DateTime createdAt) {
    final l10n = context.l10n;
    final diff = DateTime.now().difference(createdAt);
    if (diff.inDays >= 2) return l10n.daysAgo(diff.inDays);
    if (diff.inDays == 1) return l10n.dayAgo;
    return l10n.hoursAgo(diff.inHours.clamp(1, 23));
  }

  List<({String label, VoidCallback onRemove})> _buildFilterChips(
    BuildContext context,
    CommunitySearchState state,
    CommunitySearchCubit cubit,
  ) {
    final l10n = context.l10n;
    final chips = <({String label, VoidCallback onRemove})>[];

    for (final cat in state.filter.categories) {
      chips.add((
        label: CommunityTagHelper.getLabel(context, cat),
        onRemove: () => cubit.removeFilterCategory(cat),
      ));
    }

    if (state.filter.dateRange != null) {
      final String label;
      switch (state.filter.dateRange!) {
        case DateRange.today:
          label = l10n.today;
        case DateRange.thisWeek:
          label = l10n.thisWeek;
        case DateRange.thisMonth:
          label = l10n.thisMonth;
        case DateRange.thisYear:
          label = l10n.thisYear;
      }
      chips.add((label: label, onRemove: cubit.clearFilterDateRange));
    }

    for (final level in state.filter.engagementLevels) {
      final label = level == EngagementLevel.likes100Plus
          ? l10n.likes100Plus
          : l10n.comments50Plus;
      chips.add((
        label: label,
        onRemove: () => cubit.removeFilterEngagement(level),
      ));
    }

    if (state.filter.sort != CommunitySort.newest) {
      final String label;
      switch (state.filter.sort) {
        case CommunitySort.oldest:
          label = l10n.oldest;
        case CommunitySort.mostLiked:
          label = l10n.mostLiked;
        case CommunitySort.mostCommented:
          label = l10n.mostCommented;
        default:
          label = l10n.newest;
      }
      chips.add((label: label, onRemove: cubit.resetFilterSort));
    }

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CommunitySearchCubit>();

    return Scaffold(
      appBar: SearchAppBar(
        controller: cubit.searchController,
        hintText: context.l10n.searchCommunity,
        onClear: cubit.clearSearch,
        onSearch: cubit.search,
        autofocus: true,
        actions: [
          BlocBuilder<CommunitySearchCubit, CommunitySearchState>(
            buildWhen: (prev, curr) =>
                prev.filter.hasActiveFilters != curr.filter.hasActiveFilters,
            builder: (context, state) => IconButton(
              icon: Badge(
                isLabelVisible: state.filter.hasActiveFilters,
                child: const Icon(Icons.filter_list_rounded),
              ),
              onPressed: () => showSearchFilterSheet(context),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CommunitySearchCubit, CommunitySearchState>(
        builder: (context, state) {
          return Column(
            children: [
              ActiveFiltersBar(chips: _buildFilterChips(context, state, cubit)),
              Expanded(child: _buildBody(context, state, cubit)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    CommunitySearchState state,
    CommunitySearchCubit cubit,
  ) {
    final theme = Theme.of(context);

    if (state.isInitial) {
      return RecentSearchesView(
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
              style: MyTextStyle.body.l.copyWith(fontWeight: FontWeight.w600),
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
                  userName: post.authorIsActive
                      ? post.authorName
                      : context.l10n.deletedUser,
                  timeAgo: _timeAgo(context, post.createdAt),
                  category: post.postCategory,
                  title: post.title,
                  description: post.content,
                  attachmentUrls: post.attachmentUrls,
                  likes: post.likesCount,
                  comments: post.commentsCount,
                  isVerified: post.author?.isVerified ?? false,
                  isLiked: state.likedPostIds.contains(post.postId),
                  isBookmarked: state.bookmarkedPostIds.contains(post.postId),
                  onAuthorTap: post.authorIsActive
                      ? () => Navigator.pushNamed(
                            context,
                            MyRoutes.profile,
                            arguments: {
                              'userId': post.authorId,
                              'isOwnProfile': post.authorId ==
                                  Supabase.instance.client.auth.currentUser?.id,
                            },
                          )
                      : null,
                  onLikeToggle: () async {
                    if (!await GuestGuard.requireAccount(context)) return;
                    cubit.toggleLike(post.postId);
                  },
                  onBookmarkToggle: () async {
                    if (!await GuestGuard.requireAccount(context)) return;
                    cubit.toggleBookmark(post.postId);
                  },
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
  }
}
