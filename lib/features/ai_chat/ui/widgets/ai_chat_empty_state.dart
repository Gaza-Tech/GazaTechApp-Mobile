import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

class AiChatEmptyState extends StatelessWidget {
  const AiChatEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 64.sp,
              color: MyColors.primary.base,
            ),
            const VerticalSpace(16),
            Text(
              context.l10n.aiChatEmptyTitle,
              style: MyTextStyle.heading.h4.copyWith(
                color: theme.textTheme.titleLarge?.color,
              ),
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(8),
            Text(
              context.l10n.aiChatEmptySubtitle,
              style: MyTextStyle.body.m.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
