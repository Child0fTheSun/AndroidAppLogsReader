import 'package:as_app_logs_reader/core/di/service_locator.dart';
import 'package:as_app_logs_reader/data/services/locale_service.dart';
import 'package:as_app_logs_reader/data/services/storage_service.dart';
import 'package:as_app_logs_reader/data/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// ViewModel for the [SettingsScreen].
///
/// Manages the state of the settings screen, including:
/// - Loading and saving application settings (language, theme)
/// - Fetching application version information
class SettingsScreenViewModel extends ChangeNotifier {
  final _storageService = getIt<StorageService>();
  final _localeService = getIt<LocaleService>();
  final _themeService = getIt<ThemeService>();

  // State
  String _selectedLanguage = 'en'; // Default to English
  ThemeMode _selectedTheme = ThemeMode.system;
  bool _isLoading = false;
  String _appVersion = '';

  // Getters
  String get selectedLanguage => _selectedLanguage;
  ThemeMode get selectedTheme => _selectedTheme;
  bool get isLoading => _isLoading;
  String get appVersion => _appVersion;

  /// Initializes the ViewModel by loading settings and app version
  Future<void> initialize() async {
    await loadSettings();
    await _loadAppVersion();
    _selectedLanguage = _localeService.localeNotifier.value.languageCode;
    _selectedTheme = _themeService.themeModeNotifier.value;
    notifyListeners();
  }

  Future<void> _loadAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    notifyListeners();
  }

  /// Loads settings from storage
  Future<void> loadSettings() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Load language
      final language = await _storageService.getLanguage();
      if (language != null) {
        _selectedLanguage = language;
      }

      // Load theme
      final theme = await _storageService.getTheme();
      if (theme != null) {
        _selectedTheme = _themeModeFromString(theme);
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Changes the application language.
  ///
  /// Updates the selected language in the ViewModel and persists it via [LocaleService].
  Future<void> setLanguage(String languageCode) async {
    _selectedLanguage = languageCode;
    // Use LocaleService to trigger app-wide locale change
    await _localeService.saveLocale(Locale(languageCode));
    notifyListeners();
  }

  /// Changes the application theme.
  ///
  /// Updates the selected theme in the ViewModel and persists it via [ThemeService].
  Future<void> setTheme(ThemeMode theme) async {
    _selectedTheme = theme;
    // Use ThemeService to trigger app-wide theme change
    await _themeService.saveTheme(theme);
    notifyListeners();
  }

  /// Converts a string to [ThemeMode]
  ThemeMode _themeModeFromString(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  /// Gets the display name for a language code
  String getLanguageDisplayName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'ru':
        return 'Русский';
      default:
        return languageCode;
    }
  }

  /// Gets the list of available language codes
  List<String> getAvailableLanguages() {
    return ['en', 'ru'];
  }
}
