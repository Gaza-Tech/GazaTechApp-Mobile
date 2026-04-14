import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/theme/theme_persistence.dart';
import 'package:gaza_tech/core/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ThemePersistence _persistence;

  ThemeCubit(this._persistence) : super(const ThemeState()) {
    _loadSavedTheme();
  }

  Future<void> _loadSavedTheme() async {
    final saved = await _persistence.getSavedThemeMode();
    if (saved != null) emit(ThemeState(themeMode: saved));
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _persistence.saveThemeMode(mode);
    emit(ThemeState(themeMode: mode));
  }
}
