import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/features/community/cubit/community_cubit.dart';
import 'package:gaza_tech/features/community/cubit/community_state.dart';
import 'package:gaza_tech/features/community/ui/widgets/community_category_chips.dart';
import 'package:gaza_tech/features/community/data/models/community_sort.dart';
import 'package:gaza_tech/features/community/ui/widgets/community_search_bar.dart';
import 'package:gaza_tech/features/community/ui/widgets/community_sort_sheet.dart';
import 'package:gaza_tech/features/community/ui/widgets/posts_tab_view.dart';

class CommunityScreen extends StatefulWidget {
  final ScrollController scrollController;

  const CommunityScreen({super.key, required this.scrollController});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  static const _categoryValues = [
    'all',
    'questions',
    'tips',
    'news',
    'troubleshooting',
  ];

  late final TabController _tabController;
  late CommunityCubit _cubit;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _categoryValues.length,
      vsync: this,
    );
    _tabController.addListener(_onTabChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cubit = context.read<CommunityCubit>();
    _cubit.fetchIfNeeded('all');
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      _cubit.changeCategory(_categoryValues[_tabController.index]);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
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

        return NestedScrollView(
          controller: widget.scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(context.l10n.community),
                floating: true,
                snap: true,
                pinned: false,
                actions: [
                  IconButton(
                    icon: Icon(Icons.person_outline, size: 26.sp),
                    onPressed: () {},
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(112.h),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        child: CommunitySearchBar(
                          onSortTap: () =>
                              showCommunitySortSheet(context),
                          hasActiveSort:
                              state.timeSort != CommunityTimeSort.newest ||
                                  state.popularitySort != null,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      CommunityCategoryChips(
                        categories: categories,
                        selectedIndex:
                            selectedIndex < 0 ? 0 : selectedIndex,
                        onCategoryChanged: (index) =>
                            _tabController.animateTo(index),
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: _categoryValues
                .map((slug) => PostsTabView(category: slug))
                .toList(),
          ),
        );
      },
    );
  }
}
