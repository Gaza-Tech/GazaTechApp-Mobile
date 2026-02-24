import 'package:flutter/material.dart';

class LocaleHelper {
  static const String arabicFontFamily = 'IBMPlexSansArabic';
  static const String englishFontFamily = 'IBMPlexSans';

  static String getFontFamily(Locale locale) {
    return locale.languageCode == 'ar' ? arabicFontFamily : englishFontFamily;
  }

  static const List<Locale> supportedLocales = [Locale('en'), Locale('ar')];

  static TextDirection getTextDirection(Locale locale) {
    return locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
  }

  static bool isRtl(Locale locale) {
    return locale.languageCode == 'ar';
  }

  /// Get device locale if supported, otherwise return English
  static Locale getDeviceLocale(Locale? deviceLocale) {
    if (deviceLocale == null) return const Locale('en');

    // Check if device locale is supported
    for (final supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == deviceLocale.languageCode) {
        return supportedLocale;
      }
    }

    // Default to English if device locale is not supported
    return const Locale('en');
  }
}
