import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/features/notifications/cubit/notification_cubit.dart';
import 'package:gaza_tech/features/notifications/cubit/notification_state.dart';

class NotificationBellIcon extends StatelessWidget {
  final VoidCallback onTap;

  const NotificationBellIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      buildWhen: (prev, curr) => prev.unreadCount != curr.unreadCount,
      builder: (context, state) {
        return IconButton(
          icon: Badge(
            isLabelVisible: state.unreadCount > 0,
            label: Text(
              state.unreadCount > 99 ? '99+' : '${state.unreadCount}',
              style: TextStyle(fontSize: 9.sp),
            ),
            child: const Icon(Icons.notifications_outlined),
          ),
          onPressed: onTap,
        );
      },
    );
  }
}
