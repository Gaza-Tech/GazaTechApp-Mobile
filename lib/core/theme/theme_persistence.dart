import 'package:flutter/material.dart';
import 'package:gaza_tech/core/cache/shared_pref_keys.dart';
import 'package:gaza_tech/core/helpers/shared_pref_helper.dart';

class ThemePersistence {
  ThemePersistence();

  Future<ThemeMode?> getSavedThemeMode() async {
    final value = await SharedPrefHelper.getString(SharedPrefKeys.appTheme);
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return null;
    }
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    final value = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    await SharedPrefHelper.setData(SharedPrefKeys.appTheme, value);
  }
}
