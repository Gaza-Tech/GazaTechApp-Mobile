import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/features/bookmarks/cubit/bookmarks_cubit.dart';
import 'widgets/bookmarked_listings_tab.dart';
import 'widgets/bookmarked_posts_tab.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    final cubit = context.read<BookmarksCubit>();
    cubit.fetchBookmarkedPosts();
    cubit.fetchBookmarkedListings();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.bookmarks),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: context.l10n.bookmarkedPosts),
            Tab(text: context.l10n.bookmarkedListings),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          BookmarkedPostsTab(),
          BookmarkedListingsTab(),
        ],
      ),
    );
  }
}
