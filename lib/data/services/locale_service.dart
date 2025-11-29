import 'package:as_app_logs_reader/core/di/service_locator.dart';
import 'package:as_app_logs_reader/data/services/storage_service.dart';
import 'package:as_app_logs_reader/core/utils/s.dart';
import 'package:flutter/material.dart';

/// Service for handling application localization
///
/// Manages the selection and persistence of the application language:
/// - Loads saved locale on startup
/// - Determines default locale based on system settings
/// - Saves selected locale
/// - Notifies listeners about locale changes via [ValueNotifier]
class LocaleService {
  final _storage = getIt<StorageService>();

  /// Notifier for locale changes to update the UI
  ValueNotifier<Locale> localeNotifier = ValueNotifier(Locale('en'));

  /// Constructor for the locale service
  ///
  /// Automatically loads the saved locale upon instantiation
  LocaleService() {
    _loadLocale();
  }

  /// Loads information about the saved locale
  Future<void> _loadLocale() async {
    final locale = await _storage.getString('app_language');

    if (locale != null) {
      localeNotifier.value = Locale(locale);
    } else {
      _initLocale();
    }
  }

  /// Saves the selected locale to storage
  ///
  /// Saves the language code to secure storage and updates the notifier
  ///
  /// [locale] - The locale to save
  Future<void> saveLocale(Locale locale) async {
    if (localeNotifier.value == locale) return;

    await _storage.setString('app_language', locale.languageCode);

    localeNotifier.value = locale;
  }

  /// Initializes the locale on first app launch
  void _initLocale() {
    final defaultLocale = WidgetsBinding.instance.platformDispatcher.locale;

    if (_isLocaleSupported(defaultLocale)) {
      localeNotifier.value = defaultLocale;
    } else {
      localeNotifier.value = Locale('ru');
    }

    saveLocale(localeNotifier.value);
  }

  /// Checks if the locale is supported by the application
  bool _isLocaleSupported(Locale locale) {
    return S.supportedLocales.any(
      (supported) => supported.languageCode == locale.languageCode,
    );
  }
}
