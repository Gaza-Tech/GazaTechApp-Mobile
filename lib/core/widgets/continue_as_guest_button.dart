import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/extentions/extentions.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class ContinueAsGuestButton extends StatelessWidget {
  const ContinueAsGuestButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        side: BorderSide(color: isDark ? Colors.grey[700]! : Colors.grey[300]!),
        backgroundColor: isDark ? Colors.grey[850] : Colors.white,
      ),
      child: isLoading
          ? SizedBox(
              height: 20.h,
              width: 20.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: isDark ? Colors.white : Colors.black87,
              ),
            )
          : Text(
              context.l10n.continueAsGuest,
              style: MyTextStyle.action.m.copyWith(
                color: isDark ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
    );
  }
}
