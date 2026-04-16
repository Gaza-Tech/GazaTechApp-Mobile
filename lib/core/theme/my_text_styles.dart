import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A class that holds the text styles from the Figma design.
///
/// This class is not meant to be instantiated. It provides static access
/// to the app's text styles, organized by category.
///
/// Example:
/// ```
/// Text(
///   'Hello World',
///   style: MyTextStyle.Heading.h1,
/// )
/// ```
class MyTextStyle {
  // Private consructor to prevent instantiation.
  MyTextStyle._();

  static const String arFontFamily = 'IBMPlexSansArabic';
  static const String enFontFamily = 'IBMPlexSans';

  static String fontFamilyForLocale(Locale locale) {
    return locale.languageCode == 'ar' ? arFontFamily : enFontFamily;
  }

  /// 'Heading' text styles (H1-H5).
  static MyHeadingStyles heading = MyHeadingStyles._();

  /// 'Body' text styles (XL-XS).
  static MyBodyStyles body = MyBodyStyles._();

  /// 'Action' text styles (L-S).
  static MyActionStyles action = MyActionStyles._();

  /// 'Caption' text styles (M).
  static MyCaptionStyles caption = MyCaptionStyles._();
}

/// Helper class for 'Heading' text styles.
class MyHeadingStyles {
  MyHeadingStyles._();

  final TextStyle h1 = TextStyle(
    fontWeight: FontWeight.w800, // Extra bold
    fontSize: 24.0.sp,
  );

  final TextStyle h2 = TextStyle(
    fontWeight: FontWeight.w800, // Extra bold
    fontSize: 18.0.sp,
  );

  final TextStyle h3 = TextStyle(
    fontWeight: FontWeight.w800, // Extra bold
    fontSize: 16.0.sp,
  );

  final TextStyle h4 = TextStyle(
    fontWeight: FontWeight.w700, // Bold
    fontSize: 14.0.sp,
  );

  final TextStyle h5 = TextStyle(
    fontWeight: FontWeight.w700, // Bold
    fontSize: 12.0.sp,
  );
}

/// Helper class for 'Body' text styles.
class MyBodyStyles {
  MyBodyStyles._();

  final TextStyle xl = TextStyle(
    fontWeight: FontWeight.w400, // Regular
    fontSize: 18.0.sp,
  );

  final TextStyle l = TextStyle(
    fontWeight: FontWeight.w400, // Regular
    fontSize: 16.0.sp,
  );

  final TextStyle m = TextStyle(
    fontWeight: FontWeight.w400, // Regular
    fontSize: 14.0.sp,
  );

  final TextStyle s = TextStyle(
    fontWeight: FontWeight.w400, // Regular
    fontSize: 12.0.sp,
  );

  final TextStyle xs = TextStyle(
    fontWeight: FontWeight.w500, // Medium
    fontSize: 10.0.sp,
  );
}

/// Helper class for 'Action' text styles.
class MyActionStyles {
  MyActionStyles._();

  final TextStyle l = TextStyle(
    fontWeight: FontWeight.w600, // Semi Bold
    fontSize: 14.0.sp,
  );

  final TextStyle m = TextStyle(
    fontWeight: FontWeight.w600, // Semi Bold
    fontSize: 12.0.sp,
  );

  final TextStyle s = TextStyle(
    fontWeight: FontWeight.w600, // Semi Bold
    fontSize: 10.0.sp,
  );
}

/// Helper class for 'Caption' text styles.
class MyCaptionStyles {
  MyCaptionStyles._();

  final TextStyle m = TextStyle(
    fontWeight: FontWeight.w600, // Semi Bold
    fontSize: 10.0.sp,
  );
}
