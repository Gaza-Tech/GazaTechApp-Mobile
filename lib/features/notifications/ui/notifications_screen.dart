import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/notifications/cubit/notification_cubit.dart';
import 'package:gaza_tech/features/notifications/cubit/notification_state.dart';
import 'widgets/notification_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter == 0) {
      context.read<NotificationCubit>().fetchMoreNotifications();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notifications),
        actions: [
          BlocBuilder<NotificationCubit, NotificationState>(
            buildWhen: (prev, curr) => prev.unreadCount != curr.unreadCount,
            builder: (context, state) {
              if (state.unreadCount == 0) return const SizedBox.shrink();
              return TextButton(
                onPressed: () =>
                    context.read<NotificationCubit>().markAllAsRead(),
                child: Text(
                  l10n.markAllAsRead,
                  style: TextStyle(fontSize: 13.sp),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null && state.notifications.isEmpty) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: MyTextStyle.body.m,
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state.notifications.isEmpty) {
            return _buildEmptyState(context);
          }

          return RefreshIndicator(
            onRefresh: () =>
                context.read<NotificationCubit>().fetchNotifications(),
            child: ListView.separated(
              controller: _scrollController,
              itemCount:
                  state.notifications.length + (state.isLoadingMore ? 1 : 0),
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 0.5,
                indent: 16.w,
                endIndent: 16.w,
              ),
              itemBuilder: (context, index) {
                if (index == state.notifications.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return NotificationCard(
                  notification: state.notifications[index],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications_none_rounded,
            size: 64.sp,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          SizedBox(height: 16.h),
          Text(
            context.l10n.noNotifications,
            style: MyTextStyle.heading.h5.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            context.l10n.noNotificationsSubtitle,
            style: MyTextStyle.body.m.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
