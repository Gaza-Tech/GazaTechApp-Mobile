import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/features/marketplace/ui/marketplace_screen.dart';
import 'package:gaza_tech/features/community/ui/community_screen.dart';
import 'package:gaza_tech/features/home/ui/widgets/my_drawer.dart';
import 'package:gaza_tech/features/auth/sign_out/widgets/sign_out_bloc_listener.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;
  late final List<ScrollController> _scrollControllers;

  bool _isFabExtended = true;
  bool _isBottomNavVisible = true;

  @override
  void initState() {
    super.initState();

    // Initialize scroll controllers for each screen
    _scrollControllers = List.generate(2, (_) => ScrollController());

    // Initialize screens with their respective scroll controllers
    _screens = [
      MarketplaceScreen(scrollController: _scrollControllers[0]),
      CommunityScreen(scrollController: _scrollControllers[1]),
    ];
  }

  bool _handleScrollNotification(UserScrollNotification notification) {
    if (notification.direction == ScrollDirection.reverse) {
      // Scrolling down - hide bottom nav and shrink FAB
      if (_isBottomNavVisible) {
        setState(() {
          _isBottomNavVisible = false;
          _isFabExtended = false;
        });
      }
    } else if (notification.direction == ScrollDirection.forward) {
      // Scrolling up - show bottom nav and extend FAB
      if (!_isBottomNavVisible) {
        setState(() {
          _isBottomNavVisible = true;
          _isFabExtended = true;
        });
      }
    }
    return false;
  }

  @override
  void dispose() {
    for (var controller in _scrollControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Stack(
        children: [
          Scaffold(
            drawer: const MyDrawer(),
            extendBody: true,
            body: IndexedStack(index: _currentIndex, children: _screens),
            bottomNavigationBar: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: _isBottomNavVisible ? kBottomNavigationBarHeight : 0,
              child: Wrap(
                children: [
                  BottomNavigationBar(
                    currentIndex: _currentIndex,
                    onTap: (index) => setState(() => _currentIndex = index),
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Theme.of(context).colorScheme.primary,
                    items: [
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.store_outlined),
                        label: context.l10n.marketplace,
                        activeIcon: const Icon(Icons.store),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.people_outline),
                        label: context.l10n.community,
                        activeIcon: const Icon(Icons.people),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButton: _buildFab(context),
          ),
          const SignOutBlocListener(),
        ],
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: FloatingActionButton.extended(
        onPressed: () => _onFabPressed(context),
        icon: Icon(_currentIndex == 0 ? Icons.add : Icons.create),
        label: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isFabExtended
              ? Text(_currentIndex == 0 ? context.l10n.addListing : 'New Post')
              : const SizedBox.shrink(),
        ),
        isExtended: _isFabExtended,
      ),
    );
  }

  void _onFabPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _currentIndex == 0 ? 'Add new listing' : 'Create new post',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
