import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/helpers/guest_guard.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';
import 'package:gaza_tech/core/widgets/my_button.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';
import 'package:gaza_tech/features/verification/data/models/verification_request_model.dart';
import 'package:intl/intl.dart';

import 'status_timeline.dart';

class StatusCard extends StatelessWidget {
  final VerificationRequestModel request;

  const StatusCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStatusBadge(context, theme),
        const VerticalSpace(24),
        if (request.submittedAt != null)
          Text(
            context.l10n.submittedOn(
              DateFormat.yMMMd().format(request.submittedAt!),
            ),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        if (request.reviewedAt != null) ...[
          const VerticalSpace(4),
          Text(
            context.l10n.reviewedOn(
              DateFormat.yMMMd().format(request.reviewedAt!),
            ),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        const VerticalSpace(24),
        StatusTimeline(status: request.verificationStatus),
        if (request.verificationStatus == 'rejected' &&
            request.rejectionReason != null) ...[
          const VerticalSpace(24),
          _buildRejectionCard(context, theme),
        ],
        if (request.verificationStatus == 'pending') ...[
          const VerticalSpace(24),
          Text(
            context.l10n.verificationUnderReview,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        if (request.verificationStatus == 'rejected' ||
            request.verificationStatus == 'expired') ...[
          const VerticalSpace(24),
          MyButton(
            text: context.l10n.resubmitVerification,
            onPressed: () async {
              if (!await GuestGuard.requireAccount(context)) return;
              if (!context.mounted) return;
              context.pushNamed(MyRoutes.verificationForm);
            },
          ),
        ],
      ],
    );
  }

  Widget _buildStatusBadge(BuildContext context, ThemeData theme) {
    final (label, color) = _statusInfo(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_statusIcon(), color: color, size: 18.sp),
          SizedBox(width: 8.w),
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRejectionCard(BuildContext context, ThemeData theme) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.rejectionReason,
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onErrorContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            request.rejectionReason!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onErrorContainer,
            ),
          ),
        ],
      ),
    );
  }

  (String, Color) _statusInfo(BuildContext context) {
    switch (request.verificationStatus) {
      case 'approved':
        return (context.l10n.verificationApproved, Colors.green);
      case 'rejected':
        return (context.l10n.verificationRejected, Colors.red);
      case 'expired':
        return (context.l10n.verificationExpired, Colors.grey);
      case 'suspicious':
        return (context.l10n.verificationSuspicious, Colors.orange);
      default:
        return (context.l10n.verificationPending, Colors.amber);
    }
  }

  IconData _statusIcon() {
    switch (request.verificationStatus) {
      case 'approved':
        return Icons.verified;
      case 'rejected':
        return Icons.cancel_outlined;
      case 'expired':
        return Icons.timer_off_outlined;
      case 'suspicious':
        return Icons.warning_amber_outlined;
      default:
        return Icons.hourglass_top_outlined;
    }
  }
}
