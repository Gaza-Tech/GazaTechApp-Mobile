import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/marketplace/ui/marketplace_screen.dart';
import 'package:gaza_tech/features/community/ui/community_screen.dart';
import 'package:gaza_tech/features/home/ui/widgets/my_drawer.dart';
import 'package:gaza_tech/features/auth/logout/cubit/logout_cubit.dart';
import 'package:gaza_tech/features/auth/logout/cubit/logout_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;
  late final List<ScrollController> _scrollControllers;

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

  @override
  void dispose() {
    for (var controller in _scrollControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        state.whenOrNull(
          loggedOut: () => Navigator.pushNamedAndRemoveUntil(
            context,
            MyRoutes.signIn,
            (route) => false,
          ),
          error: (message) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message), backgroundColor: Colors.red),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(title: Text(_getTitle(context)), elevation: 2),
        drawer: const MyDrawer(),
        body: IndexedStack(index: _currentIndex, children: _screens),
        bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }

  String _getTitle(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        return context.l10n.marketplace;
      case 1:
        return context.l10n.community;
      default:
        return '';
    }
  }
}
