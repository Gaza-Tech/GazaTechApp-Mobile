import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/features/profile/cubit/profile_cubit.dart';
import 'package:gaza_tech/features/profile/cubit/profile_state.dart';
import 'package:gaza_tech/features/profile/ui/widgets/profile_header.dart';
import 'package:gaza_tech/features/profile/ui/widgets/profile_listings_tab.dart';
import 'package:gaza_tech/features/profile/ui/widgets/profile_posts_tab.dart';
import 'package:gaza_tech/features/report/data/models/report_reason.dart';
import 'package:gaza_tech/features/report/ui/widgets/report_bottom_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Text(
                    state.userProfile?.fullName ?? context.l10n.profile,
                  ),
                  pinned: true,
                  floating: false,
                  forceElevated: innerBoxIsScrolled,
                  actions: [
                    if (state.isOwnProfile && state.userProfile != null)
                      IconButton(
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () async {
                          final refreshed = await Navigator.pushNamed(
                            context,
                            MyRoutes.editProfile,
                            arguments: state.userProfile,
                          );
                          if (refreshed == true && context.mounted) {
                            context.read<ProfileCubit>().loadProfile();
                          }
                        },
                      ),
                    if (!state.isOwnProfile && state.userProfile != null)
                      IconButton(
                        icon: const Icon(Icons.flag_rounded),
                        onPressed: () => showReportBottomSheet(
                          context,
                          entityType: ReportEntityType.user,
                          entityId: state.userProfile!.userId,
                        ),
                      ),
                  ],
                ),
                SliverToBoxAdapter(child: _buildHeader(context, state)),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _TabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: context.l10n.myPosts),
                        Tab(text: context.l10n.myListings),
                      ],
                    ),
                    Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: const [ProfilePostsTab(), ProfileListingsTab()],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, ProfileState state) {
    if (state.isProfileLoading) {
      return SizedBox(
        height: 200.h,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    if (state.userProfile == null) {
      if (state.errorMessage != null) {
        return SizedBox(
          height: 200.h,
          child: Center(child: Text(state.errorMessage!)),
        );
      }
      return const SizedBox.shrink();
    }
    return ProfileHeader(
      profile: state.userProfile!,
      isOwnProfile: state.isOwnProfile,
      verificationStatus: state.verificationStatus,
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color backgroundColor;

  _TabBarDelegate(this.tabBar, this.backgroundColor);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(color: backgroundColor, child: tabBar);
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) => false;
}
