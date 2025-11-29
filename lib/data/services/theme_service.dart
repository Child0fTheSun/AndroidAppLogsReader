import 'package:as_app_logs_reader/core/di/service_locator.dart';
import 'package:as_app_logs_reader/data/services/storage_service.dart';
import 'package:flutter/material.dart';

/// Service for handling application theme
///
/// Manages the selection and persistence of the application theme:
/// - Loads saved theme on startup
/// - Determines default theme (system)
/// - Saves selected theme
/// - Notifies listeners about theme changes via [ValueNotifier]
class ThemeService {
  final _storage = getIt<StorageService>();

  /// Notifier for theme changes to update the UI
  ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.system);

  /// Constructor for the theme service
  ///
  /// Automatically loads the saved theme upon instantiation
  ThemeService() {
    _loadTheme();
  }

  /// Loads information about the saved theme
  Future<void> _loadTheme() async {
    final theme = await _storage.getTheme();

    if (theme != null) {
      themeModeNotifier.value = _themeModeFromString(theme);
    } else {
      // Default to system theme
      themeModeNotifier.value = ThemeMode.system;
      saveTheme(ThemeMode.system);
    }
  }

  /// Saves the selected theme to storage
  ///
  /// Saves the theme mode to storage and updates the notifier
  ///
  /// [themeMode] - The theme mode to save
  Future<void> saveTheme(ThemeMode themeMode) async {
    if (themeModeNotifier.value == themeMode) return;

    await _storage.setTheme(_themeStringFromMode(themeMode));

    themeModeNotifier.value = themeMode;
  }

  /// Converts a string to [ThemeMode]
  ThemeMode _themeModeFromString(String theme) {
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  /// Converts [ThemeMode] to a string
  String _themeStringFromMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}
