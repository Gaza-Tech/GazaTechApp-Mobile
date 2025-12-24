import 'package:flutter/material.dart';

/// A class that holds the color palette from the Figma design.
///
/// This class is not meant to be instantiated. It provides static access
/// to the app's colors, organized by category.
///
/// Example:
/// ```
/// Container(
///   color: MyColor.Highlight.dark,
/// )
/// ```
class MyColors {
  // Private constructor to prevent instantiation.
  MyColors._();

  /// The 'Highlight' color group.
  static const MyHighlightColors highlight = MyHighlightColors._();

  /// The 'Neutral' color group, split into Light and Dark themes.
  static const MyNeutralColors neutral = MyNeutralColors._();

  /// The 'Support' color group for states like success, warning, and error.
  static const MySupportColors support = MySupportColors._();
}

/// Helper class for 'Highlight' colors.
class MyHighlightColors {
  const MyHighlightColors._();

  // Base Color: #00D9A3 (Teal/Mint)
  final Color darkest = const Color(0xFF00D9A3);
  final Color dark = const Color(0xFF33E1B5);
  final Color medium = const Color(0xFF66E9C8);
  final Color light = const Color(0xFF99F0DB);
  final Color lightest = const Color(0xFFE5F9F6);
}

/// Helper class for 'Neutral' colors.
class MyNeutralColors {
  const MyNeutralColors._();
  final MyNeutralLightColors light = const MyNeutralLightColors._();
  final MyNeutralDarkColors dark = const MyNeutralDarkColors._();
}

/// Helper class for 'Neutral Light' colors.
class MyNeutralLightColors {
  const MyNeutralLightColors._();
  final Color darkest = const Color(0xFFc5c6cc);
  final Color dark = const Color(0xFFD4D6DD);
  final Color medium = const Color(0xFFE8E9F1);
  final Color light = const Color(0xFFF8F9FE);
  final Color lightest = const Color(0xFFFFFFFF);
}

/// Helper class for 'Neutral Dark' colors.
class MyNeutralDarkColors {
  const MyNeutralDarkColors._();
  final Color darkest = const Color(0xFF1A1A1A);
  final Color dark = const Color(0XFF242424);
  final Color medium = const Color(0xFF4D4D4D);
  final Color light = const Color(0xFF999999);
  final Color lightest = const Color(0xFFCCCCCC);
}

/// Helper class for 'Support' colors.
class MySupportColors {
  const MySupportColors._();
  final MySupportSuccessColors success = const MySupportSuccessColors._();
  final MySupportWarningColors warning = const MySupportWarningColors._();
  final MySupportErrorColors error = const MySupportErrorColors._();
}

/// Helper class for 'Support Success' colors.
class MySupportSuccessColors {
  const MySupportSuccessColors._();
  final Color dark = const Color(0xFF298267);
  final Color medium = const Color(0xFF3AC0A0);
  final Color light = const Color(0xFFE7F4EB);
}

/// Helper class for 'Support Warning' colors.
class MySupportWarningColors {
  const MySupportWarningColors._();
  final Color dark = const Color(0xFFE86339);
  final Color medium = const Color(0xFFFFB37C);
  final Color light = const Color(0xFFFFF4E4);
}

/// Helper class for 'Support Error' colors.
class MySupportErrorColors {
  const MySupportErrorColors._();
  final Color dark = const Color(0xFFED3241);
  final Color medium = const Color(0xFFFF816D);
  final Color light = const Color(0xFFFFE2E5);
}
