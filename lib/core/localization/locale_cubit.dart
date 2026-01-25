import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaza_tech/core/localization/locale_helper.dart';
import 'package:gaza_tech/core/localization/locale_persistence.dart';
import 'package:gaza_tech/core/localization/locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final LocalePersistence _localePersistence;

  LocaleCubit(this._localePersistence) : super(const LocaleState()) {
    _loadSavedLocale();
  }

  void _loadSavedLocale() {
    final savedLocale = _localePersistence.getSavedLocale();
    if (savedLocale != null) {
      emit(LocaleState(locale: savedLocale));
    } else {
      // Auto-detect from device locale
      final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
      final initialLocale = LocaleHelper.getDeviceLocale(deviceLocale);
      emit(LocaleState(locale: initialLocale));
    }
  }

  Future<void> changeLocale(Locale newLocale) async {
    await _localePersistence.saveLocale(newLocale);
    emit(LocaleState(locale: newLocale));
  }

  void toggleLocale() {
    final newLocale = state.locale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    changeLocale(newLocale);
  }

  bool get isArabic => state.locale.languageCode == 'ar';
  bool get isEnglish => state.locale.languageCode == 'en';
}
