import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/marketplace/cubit/marketplace_cubit.dart';
import 'package:gaza_tech/features/marketplace/cubit/marketplace_state.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/category_tab_bar.dart';
import 'package:gaza_tech/features/marketplace/ui/widgets/listings_tab_view.dart';

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
                floating: true,
                snap: true,
                pinned: false,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => context.pushNamed(MyRoutes.search),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(56),
                  child: CategoryTabBar(
                    categories: state.categories,
                    selectedIndex: _tabController!.index,
                    tabController: _tabController!,
                    onTabChanged: (index) {
                      _tabController!.animateTo(index);
                    },
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: categorySlugs.map((slug) {
              return ListingsTabView(category: slug);
            }).toList(),
          ),
        );
      },
    );
  }
}
