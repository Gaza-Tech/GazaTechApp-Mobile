import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.borderRadius,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    required this.text,
    this.textStyle,
    required this.onPressed,
  });

  final double? borderRadius;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, height ?? 48.h),
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor:
            foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.dg),
        ),
      ),
      child: Text(text, style: textStyle ?? MyTextStyle.action.l),
    );
  }
}
