import 'package:flutter/material.dart';

@immutable
class LocaleState {
  final Locale locale;

  const LocaleState({this.locale = const Locale('en')});

  LocaleState copyWith({Locale? locale}) {
    return LocaleState(locale: locale ?? this.locale);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocaleState && other.locale == locale;
  }

  @override
  int get hashCode => locale.hashCode;

  @override
  String toString() => 'LocaleState(locale: $locale)';
}
