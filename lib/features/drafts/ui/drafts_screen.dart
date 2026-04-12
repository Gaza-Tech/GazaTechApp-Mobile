import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/features/drafts/cubit/drafts_cubit.dart';
import 'widgets/draft_listings_tab.dart';
import 'widgets/draft_posts_tab.dart';

class DraftsScreen extends StatefulWidget {
  const DraftsScreen({super.key});

  @override
  State<DraftsScreen> createState() => _DraftsScreenState();
}

class _DraftsScreenState extends State<DraftsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    final cubit = context.read<DraftsCubit>();
    cubit.fetchPostDrafts();
    cubit.fetchListingDrafts();
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
        title: Text(context.l10n.myDrafts),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: context.l10n.draftPosts),
            Tab(text: context.l10n.draftListings),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [DraftPostsTab(), DraftListingsTab()],
      ),
    );
  }
}
