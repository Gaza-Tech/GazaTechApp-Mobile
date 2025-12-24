import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class MyTheme {
  // ==========================
  // LIGHT THEME
  // ==========================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: kFontFamily, // Used constant from text styles
      // 1. Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.highlight.darkest,
        primary: MyColors.highlight.darkest,
        secondary: MyColors.neutral.dark.light, // Mapped to a neutral grey
        surface: MyColors.neutral.light.lightest, // White
        error: MyColors.support.error.dark,
        brightness: Brightness.light,
      ),

      // Scaffold background
      scaffoldBackgroundColor: MyColors.neutral.light.light, // F8F9FE
      // 2. AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.neutral.light.lightest,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: MyColors.neutral.dark.darkest),
        titleTextStyle: MyTextStyle.heading.h2.copyWith(
          color: MyColors.neutral.dark.darkest,
        ),
      ),

      // 3. Card
      cardTheme: CardThemeData(
        color: MyColors.neutral.light.lightest,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 8.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.dg),
        ),
      ),

      // 4. Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MyColors.neutral.light.lightest,
        hintStyle: MyTextStyle.body.m.copyWith(
          color: MyColors.neutral.dark.light, // Grey text
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.neutral.light.medium),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.neutral.light.medium),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.highlight.darkest),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.support.error.dark),
        ),
      ),

      // 5. Text
      textTheme: TextTheme(
        titleMedium: MyTextStyle.heading.h3.copyWith(
          color: MyColors.neutral.dark.darkest,
        ),
        bodyMedium: MyTextStyle.body.m.copyWith(
          color: MyColors.neutral.dark.dark,
        ),
        bodySmall: MyTextStyle.body.s.copyWith(
          color: MyColors.neutral.dark.light,
        ),
      ),

      // 6. Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.highlight.darkest,
          foregroundColor: MyColors.neutral.light.lightest, // White text
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.dg),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.w),
          textStyle: MyTextStyle.action.l,
        ),
      ),
    );
  }

  // ==========================
  // DARK THEME
  // ==========================
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: kFontFamily,

      // 1. Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.highlight.darkest,
        primary: MyColors.highlight.darkest,
        secondary: MyColors.neutral.light.medium,
        surface: MyColors.neutral.dark.dark, // Dark Surface
        error: MyColors.support.error.dark,
        brightness: Brightness.dark,
      ),

      // Scaffold background
      scaffoldBackgroundColor: MyColors.neutral.dark.darkest, // 1F2024
      // 2. AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.neutral.dark.darkest,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: MyColors.neutral.light.lightest),
        titleTextStyle: MyTextStyle.heading.h2.copyWith(
          color: MyColors.neutral.light.lightest,
        ),
      ),

      // 3. Card
      cardTheme: CardThemeData(
        color: MyColors.neutral.dark.dark,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.dg),
          side: BorderSide(
            color: MyColors.neutral.light.lightest.withValues(alpha: 0.05),
          ),
        ),
      ),

      // 4. Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MyColors.neutral.dark.dark, // or darkInput if kept
        hintStyle: MyTextStyle.body.m.copyWith(
          color: MyColors.neutral.light.dark,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.neutral.dark.medium),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.neutral.dark.medium),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: MyColors.highlight.darkest),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.dg),
          borderSide: BorderSide(color: MyColors.support.error.dark),
        ),
      ),

      // 5. Text
      textTheme: TextTheme(
        titleMedium: MyTextStyle.heading.h3.copyWith(
          color: MyColors.neutral.light.lightest,
        ),
        bodyMedium: MyTextStyle.body.m.copyWith(
          color: MyColors.neutral.light.medium,
        ),
        bodySmall: MyTextStyle.body.s.copyWith(
          color: MyColors.neutral.light.dark,
        ),
      ),

      // 6. Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.highlight.darkest,
          foregroundColor: MyColors.neutral.dark.darkest,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.dg),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.w),
          textStyle: MyTextStyle.action.l,
        ),
      ),

      // 7. Icon Theme
      iconTheme: IconThemeData(color: MyColors.neutral.light.medium),

      // 8. Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: MyColors.neutral.dark.dark,
        labelStyle: MyTextStyle.body.s.copyWith(
          color: MyColors.neutral.light.lightest,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.dg),
        ),
      ),
    );
  }
}
