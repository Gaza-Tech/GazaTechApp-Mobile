import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

class SellerInfoCard extends StatelessWidget {
  final String sellerName;
  final String memberSince;
  final VoidCallback onContactSeller;
  final VoidCallback onViewProfile;

  const SellerInfoCard({
    super.key,
    required this.sellerName,
    required this.memberSince,
    required this.onContactSeller,
    required this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(12.dg),
        border: Border.all(
          color: isDark
              ? MyColors.neutral.light.lightest.withValues(alpha: 0.05)
              : MyColors.neutral.light.medium,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.dg,
                backgroundColor: MyColors.highlight.lightest,
                child: Text(
                  sellerName.isNotEmpty ? sellerName[0] : '?',
                  style: MyTextStyle.heading.h2.copyWith(
                    color: MyColors.highlight.darkest,
                  ),
                ),
              ),
              const HorizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sellerName,
                      style: MyTextStyle.heading.h4.copyWith(
                        color: theme.textTheme.titleMedium?.color,
                      ),
                    ),
                    const VerticalSpace(4),
                    Text(memberSince, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
          const VerticalSpace(16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onContactSeller,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: MyColors.highlight.darkest),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.dg),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Text(
                    context.l10n.contactSeller,
                    style: MyTextStyle.action.m.copyWith(
                      color: MyColors.highlight.darkest,
                    ),
                  ),
                ),
              ),
              const HorizontalSpace(12),
              Expanded(
                child: OutlinedButton(
                  onPressed: onViewProfile,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: isDark
                          ? MyColors.neutral.dark.medium
                          : MyColors.neutral.light.darkest,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.dg),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Text(
                    context.l10n.viewProfile,
                    style: MyTextStyle.action.m.copyWith(
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
