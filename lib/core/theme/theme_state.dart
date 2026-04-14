import 'package:flutter/material.dart';

@immutable
class ThemeState {
  final ThemeMode themeMode;

  const ThemeState({this.themeMode = ThemeMode.system});

  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThemeState && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;

  @override
  String toString() => 'ThemeState(themeMode: $themeMode)';
}
