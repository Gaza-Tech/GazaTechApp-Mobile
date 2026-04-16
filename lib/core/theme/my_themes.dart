import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaza_tech/core/theme/my_colors.dart';
import 'package:gaza_tech/core/theme/my_text_styles.dart';

class MyThemes {
  // ==========================
  // LIGHT THEME
  // ==========================
  static ThemeData lightTheme(Locale locale) {
    final fontFamily = MyTextStyle.fontFamilyForLocale(locale);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: fontFamily,
      // 1. Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.primary.base,
        primary: MyColors.primary.base,
        secondary: MyColors.light.textDisabled,
        surface: MyColors.light.surface,
        error: MyColors.status.error.main,
        brightness: Brightness.light,
      ),

      // Scaffold background
      scaffoldBackgroundColor: MyColors.light.background,
      // 2. AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.light.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: MyColors.light.textPrimary),
        titleTextStyle: MyTextStyle.heading.h2.copyWith(
          color: MyColors.light.textPrimary,
          fontFamily: fontFamily,
        ),
      ),

      // 3. Card
      cardTheme: CardThemeData(
        color: MyColors.light.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 8.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),

      // 4. Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MyColors.light.surface,
        hintStyle: MyTextStyle.body.m.copyWith(
          color: MyColors.light.textDisabled,
          fontFamily: fontFamily,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: MyColors.light.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: MyColors.light.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: MyColors.primary.base),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: MyColors.status.error.main),
        ),
      ),

      // 5. Text
      textTheme: TextTheme(
        titleMedium: MyTextStyle.heading.h3.copyWith(
          color: MyColors.light.textPrimary,
        ),
        bodyMedium: MyTextStyle.body.m.copyWith(
          color: MyColors.light.textSecondary,
        ),
        bodySmall: MyTextStyle.body.s.copyWith(
          color: MyColors.light.textTertiary,
        ),
      ),

      // 6. Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primary.base,
          foregroundColor: MyColors.light.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.w),
          textStyle: MyTextStyle.action.l.copyWith(fontFamily: fontFamily),
        ),
      ),

      // 7. OutlinedButton Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),

      // 8. FilledButton Theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),

      // 9. Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: MyColors.light.surface,
        selectedColor: MyColors.primary.soft,
        checkmarkColor: MyColors.primary.base,
        labelStyle: MyTextStyle.body.s.copyWith(
          color: MyColors.light.textPrimary,
          fontFamily: fontFamily,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),

      // 10. TextButton Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: MyColors.primary.base,
          backgroundColor: MyColors.primary.container,
          textStyle: MyTextStyle.action.m.copyWith(fontFamily: fontFamily),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }

  // ==========================
  // DARK THEME
  // ==========================
  static ThemeData darkTheme(Locale locale) {
    final fontFamily = MyTextStyle.fontFamilyForLocale(locale);
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: fontFamily,

      // 1. Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyColors.primary.base,
        primary: MyColors.primary.onDark,
        secondary: MyColors.dark.textTertiary,
        surface: MyColors.dark.surface,
        error: MyColors.status.error.onDark,
        brightness: Brightness.dark,
      ),

      // Scaffold background
      scaffoldBackgroundColor: MyColors.dark.background,
      // 2. AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.dark.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: MyColors.dark.textPrimary),
        titleTextStyle: MyTextStyle.heading.h2.copyWith(
          color: MyColors.dark.textPrimary,
          fontFamily: fontFamily,
        ),
      ),

      // 3. Card
      cardTheme: CardThemeData(
        color: MyColors.dark.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(color: MyColors.dark.outlineVariant),
        ),
      ),

      // 4. Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MyColors.dark.surface,
        hintStyle: MyTextStyle.body.m.copyWith(
          color: MyColors.dark.textDisabled,
          fontFamily: fontFamily,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: MyColors.dark.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: MyColors.dark.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: MyColors.primary.onDark),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: MyColors.status.error.onDark),
        ),
      ),

      // 5. Text
      textTheme: TextTheme(
        titleMedium: MyTextStyle.heading.h3.copyWith(
          color: MyColors.dark.textPrimary,
        ),
        bodyMedium: MyTextStyle.body.m.copyWith(
          color: MyColors.dark.textSecondary,
        ),
        bodySmall: MyTextStyle.body.s.copyWith(
          color: MyColors.dark.textTertiary,
        ),
      ),

      // 6. Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primary.onDark,
          foregroundColor: MyColors.dark.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.w),
          textStyle: MyTextStyle.action.l.copyWith(fontFamily: fontFamily),
        ),
      ),

      // 7. Icon Theme
      iconTheme: IconThemeData(color: MyColors.dark.icon),

      // 8. OutlinedButton Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),

      // 9. FilledButton Theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),

      // 10. Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: MyColors.dark.surfaceVariant,
        selectedColor: MyColors.primary.containerDark,
        checkmarkColor: MyColors.primary.onDark,
        labelStyle: MyTextStyle.body.s.copyWith(
          color: MyColors.dark.textPrimary,
          fontFamily: fontFamily,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),

      // 11. TextButton Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: MyColors.primary.onDark,
          backgroundColor: MyColors.primary.containerDark,
          textStyle: MyTextStyle.action.m.copyWith(fontFamily: fontFamily),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }

  static ThemeData getTheme({
    required Brightness brightness,
    required Locale locale,
  }) {
    if (brightness == Brightness.light) {
      return lightTheme(locale);
    } else {
      return darkTheme(locale);
    }
  }
}
