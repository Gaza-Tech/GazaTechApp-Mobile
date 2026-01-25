import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalePersistence {
  static const String _localeKey = 'app_locale';

  final SharedPreferences _prefs;

  LocalePersistence(this._prefs);

  Locale? getSavedLocale() {
    final languageCode = _prefs.getString(_localeKey);
    if (languageCode != null) {
      return Locale(languageCode);
    }
    return null;
  }

  Future<void> saveLocale(Locale locale) async {
    await _prefs.setString(_localeKey, locale.languageCode);
  }
}
