import 'package:flutter/material.dart';
import 'package:gaza_tech/core/cache/shared_pref_keys.dart';
import 'package:gaza_tech/core/helpers/shared_pref_helper.dart';

class LocalePersistence {
  // Using SharedPrefHelper for cleaner and more maintainable code
  LocalePersistence();

  /// Gets the saved locale from SharedPreferences
  /// Returns null if no locale has been saved
  Future<Locale?> getSavedLocale() async {
    final languageCode = await SharedPrefHelper.getString(SharedPrefKeys.appLocale);
    if (languageCode.isNotEmpty) {
      return Locale(languageCode);
    }
    return null;
  }

  /// Saves the current locale to SharedPreferences
  Future<void> saveLocale(Locale locale) async {
    await SharedPrefHelper.setData(SharedPrefKeys.appLocale, locale.languageCode);
  }

  /// Removes the saved locale from SharedPreferences
  Future<void> clearLocale() async {
    await SharedPrefHelper.removeData(SharedPrefKeys.appLocale);
  }
}
