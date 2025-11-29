// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get titleHomeScreen => 'LogCat Reader';

  @override
  String get openFile => 'Open file';

  @override
  String get titleHistory => 'History';

  @override
  String get titleSettings => 'Settings';

  @override
  String get filterHistory => 'Filter history';

  @override
  String get clearFilter => 'Clear filter';

  @override
  String get noFileOpened => 'No file opened';

  @override
  String get noLogFound => 'No logs match the filter';

  @override
  String get search => 'Search';

  @override
  String get errorLoadingFile => 'Error loading file';

  @override
  String get openLogFile => 'Open log file';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get searchHint => 'package:com.example tag:MyTag or text';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get errorLoadingHistory => 'Error loading history';

  @override
  String get noHistory => 'No history yet';

  @override
  String get openLogcatiFiles => 'Open logcat files to see them here';

  @override
  String get removeFromHistory => 'Remove from history';

  @override
  String get fileNotFoundAndRemoved => 'File not found. Removed from history.';

  @override
  String get appearance => 'Appearance';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get applicationIcon => 'Application Icon';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get appDescription =>
      'A powerful logcat file reader for Android Studio logs';
}
