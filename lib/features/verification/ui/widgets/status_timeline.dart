import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';

class StatusTimeline extends StatelessWidget {
  final String status;

  const StatusTimeline({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final steps = [
      context.l10n.timelineSubmitted,
      context.l10n.timelineUnderReview,
      context.l10n.timelineDecision,
    ];

    int completedUpTo;
    switch (status) {
      case 'pending':
        completedUpTo = 1;
        break;
      case 'approved':
      case 'rejected':
      case 'expired':
      case 'suspicious':
        completedUpTo = 2;
        break;
      default:
        completedUpTo = 0;
    }

    return Column(
      children: List.generate(steps.length, (i) {
        final isDone = i < completedUpTo;
        final isActive = i == completedUpTo;
        return _TimelineItem(
          label: steps[i],
          isDone: isDone,
          isActive: isActive,
          isLast: i == steps.length - 1,
          status: i == steps.length - 1 ? status : null,
        );
      }),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String label;
  final bool isDone;
  final bool isActive;
  final bool isLast;
  final String? status;

  const _TimelineItem({
    required this.label,
    required this.isDone,
    required this.isActive,
    required this.isLast,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final outline = theme.colorScheme.outline;

    Color dotColor;
    IconData dotIcon;
    if (status == 'rejected') {
      dotColor = theme.colorScheme.error;
      dotIcon = Icons.close;
    } else if (isDone || isActive) {
      dotColor = primary;
      dotIcon = isDone ? Icons.check : Icons.radio_button_checked;
    } else {
      dotColor = outline;
      dotIcon = Icons.radio_button_unchecked;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 28.w,
              height: 28.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isDone || isActive) ? dotColor : Colors.transparent,
                border: Border.all(color: dotColor, width: 2),
              ),
              child: Center(
                child: Icon(
                  dotIcon,
                  size: 14.sp,
                  color: (isDone || isActive) ? Colors.white : dotColor,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 36.h,
                color: isDone ? primary : outline,
              ),
          ],
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 4.h, bottom: isLast ? 0 : 28.h),
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: (isDone || isActive)
                    ? theme.colorScheme.onSurface
                    : theme.colorScheme.onSurfaceVariant,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
