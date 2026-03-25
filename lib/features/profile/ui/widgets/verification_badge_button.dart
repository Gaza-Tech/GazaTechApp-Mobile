import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/routes/my_routes.dart';

class VerificationBadgeButton extends StatelessWidget {
  final String? verificationStatus;

  const VerificationBadgeButton({super.key, required this.verificationStatus});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (verificationStatus == null) {
      return _buildChip(
        context: context,
        label: context.l10n.getVerified,
        icon: Icons.verified_outlined,
        color: theme.colorScheme.primary,
        onTap: () => context.pushNamed(MyRoutes.verificationForm),
      );
    }

    switch (verificationStatus) {
      case 'pending':
        return _buildChip(
          context: context,
          label: context.l10n.verificationPending,
          icon: Icons.hourglass_top_outlined,
          color: Colors.amber.shade700,
          onTap: () => context.pushNamed(MyRoutes.verificationStatus),
        );
      case 'rejected':
        return _buildChip(
          context: context,
          label: context.l10n.verificationRejected,
          icon: Icons.cancel_outlined,
          color: theme.colorScheme.error,
          onTap: () => context.pushNamed(MyRoutes.verificationStatus),
        );
      case 'expired':
        return _buildChip(
          context: context,
          label: context.l10n.verificationExpired,
          icon: Icons.timer_off_outlined,
          color: Colors.grey,
          onTap: () => context.pushNamed(MyRoutes.verificationStatus),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildChip({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14.sp, color: color),
            SizedBox(width: 6.w),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
