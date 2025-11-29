import 'package:as_app_logs_reader/src/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Utility class for accessing localized strings and locale information
class S {
  static const locale = Locale('en');

  static const en = Locale('en');
  static const ru = Locale('ru');
  static const es = Locale('es');
  static const it = Locale('it');

  /// List of supported locales in the application
  static const supportedLocales = [en, ru, es, it];

  /// List of localization delegates for the application
  static const localizationDelegates = <LocalizationsDelegate>[
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    AppLocalizations.delegate,
  ];

  /// Retrieves the [AppLocalizations] instance for the given [context]
  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context);

  /// Returns the human-readable name of the language for the given [locale]
  static String getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'ru':
        return 'Русский';
      case 'es':
        return 'Español';
      case 'it':
        return 'Italiano';
      default:
        return locale.languageCode.toUpperCase();
    }
  }
}
