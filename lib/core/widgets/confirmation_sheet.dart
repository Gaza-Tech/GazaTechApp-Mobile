import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/widgets/spacing_widgets.dart';

void showConfirmationSheet(
  BuildContext context, {
  required String title,
  required String body,
  required String confirmLabel,
  required VoidCallback onConfirm,
  Color? confirmColor,
}) {
  final theme = Theme.of(context);

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (bottomSheetContext) {
      return Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: theme.dividerColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            const VerticalSpace(16),
            Text(title, style: theme.textTheme.titleLarge),
            const VerticalSpace(8),
            Text(
              body,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const VerticalSpace(24),
            FilledButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(
                  Size(double.infinity, 48.h),
                ),
                backgroundColor: WidgetStateProperty.all(
                  confirmColor ?? theme.colorScheme.primary,
                ),
              ),
              onPressed: () {
                Navigator.pop(bottomSheetContext);
                onConfirm();
              },
              child: Text(confirmLabel),
            ),
          ],
        ),
      );
    },
  );
}
