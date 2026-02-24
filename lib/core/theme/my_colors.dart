import 'package:flutter/material.dart';

/// A class that holds the color palette extracted from the Gmail Material 3 design.
///
/// This class is not meant to be instantiated. It provides static access
/// to the app's colors, organized by category.
///
/// Example:
/// ```
/// Container(
///   color: MyColors.primary.base,
/// )
/// ```
class MyColors {
  // Private constructor to prevent instantiation.
  MyColors._();

  /// Brand blue accent colors.
  static const MyPrimaryColors primary = MyPrimaryColors._();

  /// Light theme palette (surfaces, text, outlines).
  static const MyLightPalette light = MyLightPalette._();

  /// Dark theme palette (surfaces, text, outlines).
  static const MyDarkPalette dark = MyDarkPalette._();

  /// Semantic status colors (success, warning, error).
  static const MyStatusColors status = MyStatusColors._();
}

/// Helper class for primary blue accent colors.
class MyPrimaryColors {
  const MyPrimaryColors._();

  /// Main blue — buttons, links, active states.
  final Color base = const Color(0xFF0B57D0);

  /// Deeper blue — pressed/deep interactive states.
  final Color deep = const Color(0xFF0842A0);

  /// Light blue container — FAB background, selected chips (light mode).
  final Color container = const Color(0xFFC2E7FF);

  /// Soft blue — hover states, subtle highlights (light mode).
  final Color soft = const Color(0xFFE8F0FE);

  /// Adapted blue for dark backgrounds.
  final Color onDark = const Color(0xFFA8C7FA);

  /// Dark mode container — FAB/container background (dark mode).
  final Color containerDark = const Color(0xFF004A77);

  /// Dark mode soft — selected/hover states (dark mode).
  final Color softDark = const Color(0xFF1B3A5C);
}

/// Helper class for light theme palette.
class MyLightPalette {
  const MyLightPalette._();

  /// Main scaffold background — Pure White.
  final Color background = const Color(0xFFFFFFFF);

  /// Cards, elevated surfaces.
  final Color surface = const Color(0xFFFFFFFF);

  /// Search bar, secondary areas.
  final Color surfaceVariant = const Color(0xFFF1F3F4);

  /// Titles, headings.
  final Color textPrimary = const Color(0xFF1F1F1F);

  /// Body text, previews.
  final Color textSecondary = const Color(0xFF444746);

  /// Metadata, timestamps.
  final Color textTertiary = const Color(0xFF5F6368);

  /// Hint text, disabled.
  final Color textDisabled = const Color(0xFF8E918F);

  /// Borders, dividers.
  final Color outline = const Color(0xFFC4C7C5);

  /// Subtle dividers.
  final Color outlineVariant = const Color(0xFFE3E3E3);

  /// Unselected icons.
  final Color icon = const Color(0xFF747775);
}

/// Helper class for dark theme palette.
class MyDarkPalette {
  const MyDarkPalette._();

  /// Main scaffold background.
  final Color background = const Color(0xFF1F1F1F);

  /// Cards, elevated surfaces.
  final Color surface = const Color(0xFF2D2D2D);

  /// Search bar, secondary areas.
  final Color surfaceVariant = const Color(0xFF303030);

  /// Titles, headings.
  final Color textPrimary = const Color(0xFFE3E3E3);

  /// Body text.
  final Color textSecondary = const Color(0xFFC4C7C5);

  /// Metadata.
  final Color textTertiary = const Color(0xFF9AA0A6);

  /// Hint text, disabled.
  final Color textDisabled = const Color(0xFF747775);

  /// Borders.
  final Color outline = const Color(0xFF444746);

  /// Subtle borders.
  final Color outlineVariant = const Color(0xFF3C4043);

  /// Default icons.
  final Color icon = const Color(0xFF9AA0A6);
}

/// Helper class for semantic status colors.
class MyStatusColors {
  const MyStatusColors._();
  final MySuccessColors success = const MySuccessColors._();
  final MyWarningColors warning = const MyWarningColors._();
  final MyErrorColors error = const MyErrorColors._();
}

/// Helper class for success colors.
class MySuccessColors {
  const MySuccessColors._();
  final Color main = const Color(0xFF1E8E3E);
  final Color container = const Color(0xFFC4EECE);
  final Color onDark = const Color(0xFF81C995);
  final Color containerDark = const Color(0xFF0F5223);
}

/// Helper class for warning colors.
class MyWarningColors {
  const MyWarningColors._();
  final Color main = const Color(0xFFEA8600);
  final Color container = const Color(0xFFFEF7E0);
  final Color onDark = const Color(0xFFFDD663);
  final Color containerDark = const Color(0xFF7B5800);
}

/// Helper class for error colors.
class MyErrorColors {
  const MyErrorColors._();
  final Color main = const Color(0xFFD93025);
  final Color container = const Color(0xFFFCE8E6);
  final Color onDark = const Color(0xFFF28B82);
  final Color containerDark = const Color(0xFF8C1D18);
}
