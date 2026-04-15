import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/features/notifications/cubit/notification_cubit.dart';
import 'package:gaza_tech/features/notifications/data/models/notification_model.dart';
import 'package:gaza_tech/features/notifications/data/models/notification_type.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  String _timeAgo(BuildContext context, DateTime time) {
    final l10n = context.l10n;
    final diff = DateTime.now().difference(time);
    if (diff.inDays >= 2) return l10n.daysAgo(diff.inDays);
    if (diff.inDays == 1) return l10n.dayAgo;
    if (diff.inHours >= 1) return l10n.hoursAgo(diff.inHours);
    if (diff.inMinutes >= 1) return l10n.minutesAgo(diff.inMinutes);
    return l10n.justNow;
  }

  String _buildSummary(BuildContext context) {
    final l10n = context.l10n;
    final name = notification.actorName.isNotEmpty
        ? notification.actorName
        : '?';
    final othersCount = notification.actorsCount - 1;
    final grouped = notification.actorsCount > 1;

    switch (notification.type) {
      case NotificationType.postLike:
        return grouped
            ? l10n.notificationPostLikeGrouped(name, othersCount)
            : l10n.notificationPostLikeSingle(name);
      case NotificationType.commentLike:
        return grouped
            ? l10n.notificationCommentLikeGrouped(name, othersCount)
            : l10n.notificationCommentLikeSingle(name);
      case NotificationType.postComment:
        return grouped
            ? l10n.notificationPostCommentGrouped(name, othersCount)
            : l10n.notificationPostCommentSingle(name);
      case NotificationType.commentReply:
        return grouped
            ? l10n.notificationCommentReplyGrouped(name, othersCount)
            : l10n.notificationCommentReplySingle(name);
      case NotificationType.verificationApproved:
        return l10n.notificationVerificationApproved;
      case NotificationType.verificationRejected:
        return l10n.notificationVerificationRejected;
      case NotificationType.contentRemoved:
        return l10n.notificationContentRemoved;
      case NotificationType.systemAnnouncement:
        return l10n.notificationSystemAnnouncement;
    }
  }

  IconData _typeIcon() {
    switch (notification.type) {
      case NotificationType.postLike:
      case NotificationType.commentLike:
        return Icons.favorite_rounded;
      case NotificationType.postComment:
      case NotificationType.commentReply:
        return Icons.chat_bubble_rounded;
      case NotificationType.verificationApproved:
        return Icons.verified_rounded;
      case NotificationType.verificationRejected:
        return Icons.cancel_rounded;
      case NotificationType.contentRemoved:
        return Icons.delete_rounded;
      case NotificationType.systemAnnouncement:
        return Icons.campaign_rounded;
    }
  }

  Color _badgeColor(ThemeData theme) {
    switch (notification.type) {
      case NotificationType.postLike:
      case NotificationType.commentLike:
        return Colors.red;
      case NotificationType.postComment:
      case NotificationType.commentReply:
        return theme.colorScheme.primary;
      case NotificationType.verificationApproved:
        return Colors.green;
      case NotificationType.verificationRejected:
      case NotificationType.contentRemoved:
        return theme.colorScheme.error;
      case NotificationType.systemAnnouncement:
        return theme.colorScheme.secondary;
    }
  }

  void _onTap(BuildContext context) {
    context.read<NotificationCubit>().markGroupAsRead(notification.groupKey);

    switch (notification.type) {
      case NotificationType.postLike:
      case NotificationType.postComment:
        if (notification.targetId != null) {
          Navigator.pushNamed(
            context,
            MyRoutes.postDetails,
            arguments: notification.targetId,
          );
        }
      case NotificationType.commentLike:
      case NotificationType.commentReply:
        final postId = notification.navigationPostId;
        if (postId != null) {
          Navigator.pushNamed(
            context,
            MyRoutes.postDetails,
            arguments: postId,
          );
        }
      case NotificationType.verificationApproved:
      case NotificationType.verificationRejected:
        Navigator.pushNamed(context, MyRoutes.verificationStatus);
      case NotificationType.contentRemoved:
      case NotificationType.systemAnnouncement:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUnread = !notification.isRead;

    return InkWell(
      onTap: () => _onTap(context),
      child: Container(
        color: isUnread
            ? theme.colorScheme.primary.withAlpha(15)
            : Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAvatar(theme),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _buildSummary(context),
                    style: MyTextStyle.body.m.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight:
                          isUnread ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _timeAgo(context, notification.latestCreatedAt),
                    style: MyTextStyle.body.xs.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (isUnread) ...[
              SizedBox(width: 8.w),
              Container(
                width: 8.w,
                height: 8.w,
                margin: EdgeInsets.only(top: 6.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(ThemeData theme) {
    final avatarUrl = notification.latestActorAvatarUrl;

    return Stack(
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          child: ClipOval(
            child: avatarUrl != null
                ? CachedNetworkImage(
                    imageUrl: avatarUrl,
                    width: 44.r,
                    height: 44.r,
                    fit: BoxFit.cover,
                    errorWidget: (_, _, _) => Icon(
                      Icons.person,
                      size: 22.sp,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  )
                : Icon(
                    Icons.person,
                    size: 22.sp,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 18.r,
            height: 18.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _badgeColor(theme),
              border: Border.all(color: theme.colorScheme.surface, width: 1.5),
            ),
            child: Icon(_typeIcon(), size: 10.sp, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
