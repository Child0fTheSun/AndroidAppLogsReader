import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @titleHomeScreen.
  ///
  /// In ru, this message translates to:
  /// **'LogCat Reader'**
  String get titleHomeScreen;

  /// No description provided for @openFile.
  ///
  /// In ru, this message translates to:
  /// **'Открыть файл'**
  String get openFile;

  /// No description provided for @titleHistory.
  ///
  /// In ru, this message translates to:
  /// **'История'**
  String get titleHistory;

  /// No description provided for @titleSettings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get titleSettings;

  /// No description provided for @filterHistory.
  ///
  /// In ru, this message translates to:
  /// **'История фильтрации'**
  String get filterHistory;

  /// No description provided for @clearFilter.
  ///
  /// In ru, this message translates to:
  /// **'Очистить фильтр'**
  String get clearFilter;

  /// No description provided for @noFileOpened.
  ///
  /// In ru, this message translates to:
  /// **'Файл не открыт'**
  String get noFileOpened;

  /// No description provided for @noLogFound.
  ///
  /// In ru, this message translates to:
  /// **'Логи не найдены'**
  String get noLogFound;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get search;

  /// No description provided for @errorLoadingFile.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка загрузки файла'**
  String get errorLoadingFile;

  /// No description provided for @openLogFile.
  ///
  /// In ru, this message translates to:
  /// **'Открыть файл'**
  String get openLogFile;

  /// No description provided for @scrollToTop.
  ///
  /// In ru, this message translates to:
  /// **'Вверх'**
  String get scrollToTop;

  /// No description provided for @searchHint.
  ///
  /// In ru, this message translates to:
  /// **'package:com.example tag:MyTag or text'**
  String get searchHint;

  /// No description provided for @copiedToClipboard.
  ///
  /// In ru, this message translates to:
  /// **'Скопировано в буфер обмена'**
  String get copiedToClipboard;

  /// No description provided for @errorLoadingHistory.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка загрузки истории'**
  String get errorLoadingHistory;

  /// No description provided for @noHistory.
  ///
  /// In ru, this message translates to:
  /// **'История пуста'**
  String get noHistory;

  /// No description provided for @openLogcatiFiles.
  ///
  /// In ru, this message translates to:
  /// **'Открыть файлы Logcat'**
  String get openLogcatiFiles;

  /// No description provided for @removeFromHistory.
  ///
  /// In ru, this message translates to:
  /// **'Удалить из истории'**
  String get removeFromHistory;

  /// No description provided for @fileNotFoundAndRemoved.
  ///
  /// In ru, this message translates to:
  /// **'Файл не найден. Удален из истории'**
  String get fileNotFoundAndRemoved;

  /// No description provided for @appearance.
  ///
  /// In ru, this message translates to:
  /// **'Внешний вид'**
  String get appearance;

  /// No description provided for @language.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In ru, this message translates to:
  /// **'Тема'**
  String get theme;

  /// No description provided for @light.
  ///
  /// In ru, this message translates to:
  /// **'Светлая'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In ru, this message translates to:
  /// **'Темная'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In ru, this message translates to:
  /// **'Системная'**
  String get system;

  /// No description provided for @about.
  ///
  /// In ru, this message translates to:
  /// **'О приложении'**
  String get about;

  /// No description provided for @version.
  ///
  /// In ru, this message translates to:
  /// **'Версия'**
  String get version;

  /// No description provided for @applicationIcon.
  ///
  /// In ru, this message translates to:
  /// **'Иконка приложения'**
  String get applicationIcon;

  /// No description provided for @selectLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Выберите язык'**
  String get selectLanguage;

  /// No description provided for @appDescription.
  ///
  /// In ru, this message translates to:
  /// **'Мощный читатель файлов logcat для журналов Android Studio'**
  String get appDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
