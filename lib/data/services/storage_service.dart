import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Service for secure data storage
///
/// Provides methods to save and retrieve data in secure storage
/// using [FlutterSecureStorage]. Used for storing:
/// - Authorization tokens
/// - App settings
/// - Other sensitive data
///
/// All data is encrypted at the platform level
class StorageService {
  static const _secureStorage = FlutterSecureStorage();

  /// Retrieves a string value by key
  ///
  /// [key] - The key to search for
  ///
  /// Returns the value or `null` if the key is not found
  Future<String?> getString(String key) async =>
      await _secureStorage.read(key: key);

  /// Saves a string value by key
  ///
  /// [key] - The key to save
  /// [value] - The value to save
  Future<void> setString(String key, String value) async =>
      await _secureStorage.write(key: key, value: value);

  /// Removes a value by key
  ///
  /// [key] - The key to remove
  Future<void> remove(String key) async =>
      await _secureStorage.delete(key: key);

  /// Clears the entire storage
  ///
  /// Deletes all saved data from secure storage
  Future<void> clear() async => await _secureStorage.deleteAll();

  // Keys for specific data
  static const String _lastOpenedFilePathKey = 'last_opened_file_path';

  /// Saves the path to the last opened file
  Future<void> setLastOpenedFilePath(String path) async {
    await setString(_lastOpenedFilePathKey, path);
  }

  /// Retrieves the path to the last opened file
  Future<String?> getLastOpenedFilePath() async {
    return await getString(_lastOpenedFilePathKey);
  }

  /// Clears the path to the last opened file
  Future<void> clearLastOpenedFilePath() async {
    await remove(_lastOpenedFilePathKey);
  }

  // File history
  static const String _fileHistoryKey = 'file_history';
  static const String _historySeparator = '|||';

  /// Adds a file to the history
  Future<void> addFileToHistory(String filePath) async {
    final history = await getFileHistory();

    // Remove if already exists to move it to top
    history.remove(filePath);

    // Add to beginning
    history.insert(0, filePath);

    // Keep only last 20 files
    if (history.length > 20) {
      history.removeRange(20, history.length);
    }

    // Save
    await setString(_fileHistoryKey, history.join(_historySeparator));
  }

  /// Retrieves the file history
  Future<List<String>> getFileHistory() async {
    final historyString = await getString(_fileHistoryKey);
    if (historyString == null || historyString.isEmpty) {
      return [];
    }
    return historyString.split(_historySeparator);
  }

  /// Removes a file from the history
  Future<void> removeFileFromHistory(String filePath) async {
    final history = await getFileHistory();
    history.remove(filePath);

    if (history.isEmpty) {
      await remove(_fileHistoryKey);
    } else {
      await setString(_fileHistoryKey, history.join(_historySeparator));
    }
  }

  /// Clears the file history
  Future<void> clearFileHistory() async {
    await remove(_fileHistoryKey);
  }

  // Preferences
  static const String _languageKey = 'app_language';
  static const String _themeKey = 'app_theme';

  /// Saves the selected language code
  Future<void> setLanguage(String languageCode) async {
    await setString(_languageKey, languageCode);
  }

  /// Retrieves the selected language code
  Future<String?> getLanguage() async {
    return await getString(_languageKey);
  }

  /// Saves the selected theme
  /// Values: 'light', 'dark', 'system'
  Future<void> setTheme(String theme) async {
    await setString(_themeKey, theme);
  }

  /// Retrieves the selected theme
  Future<String?> getTheme() async {
    return await getString(_themeKey);
  }
}
