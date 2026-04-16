import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/widgets/sort_button.dart';
import 'package:gaza_tech/core/widgets/tappable_search_bar.dart';
import 'package:gaza_tech/features/marketplace/cubit/marketplace_cubit.dart';
import 'package:gaza_tech/features/marketplace/cubit/marketplace_state.dart';
import 'package:gaza_tech/features/marketplace/data/models/marketplace_sort.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/category_tab_bar.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/listings_tab_view.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/marketplace_sort_sheet.dart';
import 'package:gaza_tech/features/notifications/ui/widgets/notification_bell_icon.dart';

class MarketplaceScreen extends StatefulWidget {
  final ScrollController scrollController;

  const MarketplaceScreen({super.key, required this.scrollController});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late MarketplaceCubit _marketplaceCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _marketplaceCubit = context.read<MarketplaceCubit>();
    _marketplaceCubit.fetchCategories().then((_) {
      _marketplaceCubit.fetchIfNeeded(_marketplaceCubit.state.selectedCategory);
    });
  }

  void _initTabController(int length) {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    _tabController = TabController(length: length, vsync: this);
    _tabController!.addListener(_onTabChanged);
  }

  Future<void> _onRefresh() async {
    if (_tabController != null && _tabController!.index != 0) {
      _tabController!.animateTo(0);
    }
    await _marketplaceCubit.refreshAll();
  }

  void _onTabChanged() {
    if (_tabController != null && !_tabController!.indexIsChanging) {
      final state = _marketplaceCubit.state;
      final categories = state.categories;
      if (_tabController!.index == 0) {
        _marketplaceCubit.changeCategory('all');
      } else if (_tabController!.index <= categories.length) {
        _marketplaceCubit.changeCategory(
          categories[_tabController!.index - 1].slug,
        );
      }
    }
  }

  @override
  void dispose() {
    _tabController?.removeListener(_onTabChanged);
    _tabController?.dispose();
    super.dispose();
  }

  String _sortLabel(BuildContext context, MarketplaceSort sort) {
    final l10n = context.l10n;
    return switch (sort) {
      MarketplaceSort.newest => l10n.sortNewest,
      MarketplaceSort.oldest => l10n.oldest,
      MarketplaceSort.priceLowToHigh => l10n.sortPriceLowToHigh,
      MarketplaceSort.priceHighToLow => l10n.sortPriceHighToLow,
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketplaceCubit, MarketplaceState>(
      builder: (context, state) {
        if (state.isCategoriesLoading && state.categories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // Tab count: 'all' + each DB category
        final tabCount = 1 + state.categories.length;

        // Recreate tab controller if tab count changed
        if (_tabController == null || _tabController!.length != tabCount) {
          _initTabController(tabCount);
        }

        // Build slug list: ['all', slug1, slug2, ...]
        final categorySlugs = ['all', ...state.categories.map((c) => c.slug)];

        return NestedScrollView(
          controller: widget.scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(context.l10n.marketplace),
                actions: [
                  NotificationBellIcon(
                    onTap: () =>
                        Navigator.pushNamed(context, MyRoutes.notifications),
                  ),
                  IconButton(
                    icon: const Icon(Icons.auto_awesome_rounded),
                    tooltip: context.l10n.aiChat,
                    onPressed: () => context.pushNamed(MyRoutes.aiChat),
                  ),
                ],
                floating: true,
                snap: true,
                pinned: false,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(96.h),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 8.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: TappableSearchBar(
                                onTap: () => context.pushNamed(MyRoutes.search),
                                hintText: context.l10n.searchMarketplace,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            SortButton(
                              label: _sortLabel(context, state.activeSort),
                              onTap: () => showMarketplaceSortSheet(context),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CategoryTabBar(
                        categories: state.categories,
                        selectedIndex: _tabController!.index,
                        tabController: _tabController!,
                        onTabChanged: (index) {
                          _tabController!.animateTo(index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: categorySlugs.map((slug) {
              return ListingsTabView(category: slug, onRefresh: _onRefresh);
            }).toList(),
          ),
        );
      },
    );
  }
}
