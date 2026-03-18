import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class FilterSheetShell extends StatelessWidget {
  final String title;
  final Widget Function(ScrollController controller) contentBuilder;
  final VoidCallback onApply;
  final VoidCallback onClearAll;
  final double initialChildSize;
  final double maxChildSize;

  const FilterSheetShell({
    super.key,
    required this.title,
    required this.contentBuilder,
    required this.onApply,
    required this.onClearAll,
    this.initialChildSize = 0.85,
    this.maxChildSize = 0.92,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: initialChildSize,
      maxChildSize: maxChildSize,
      builder: (_, controller) => Padding(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: MyTextStyle.body.l.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8.h),
            Divider(height: 1.h),
            Expanded(child: contentBuilder(controller)),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onClearAll,
                    child: Text(l10n.clearAll),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: FilledButton(
                    onPressed: onApply,
                    child: Text(l10n.applyFilters),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
