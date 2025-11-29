import 'package:as_app_logs_reader/core/di/service_locator.dart';
import 'package:as_app_logs_reader/data/models/log_entry.dart';
import 'package:as_app_logs_reader/data/models/log_file.dart';
import 'package:as_app_logs_reader/data/services/file_picker_service.dart';
import 'package:as_app_logs_reader/data/services/log_file_parser_service.dart';
import 'package:as_app_logs_reader/data/services/storage_service.dart';
import 'package:flutter/material.dart';

/// ViewModel for the [HomeScreen]
///
/// Manages the state of the home screen, including:
/// - Loading and parsing log files
/// - Filtering logs
/// - Managing loading and error states
class HomeScreenViewModel extends ChangeNotifier {
  final _filePickerService = getIt<FilePickerService>();
  final _parserService = getIt<LogFileParserService>();
  final _storageService = getIt<StorageService>();

  // State
  LogFile? _logFile;
  String? _currentFilePath;
  List<LogEntry> _filteredLogs = [];
  bool _isLoading = false;
  String? _error;
  String _filterText = '';

  // Getters
  LogFile? get logFile => _logFile;
  List<LogEntry> get filteredLogs => _filteredLogs;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get filterText => _filterText;
  bool get hasFile => _logFile != null;
  int get totalLogsCount => _logFile?.messages.length ?? 0;
  int get filteredLogsCount => _filteredLogs.length;

  /// Gets the file name from the current file path
  String? get fileName {
    if (_currentFilePath == null) return null;
    return _currentFilePath!.split('\\').last.split('/').last;
  }

  /// Initializes the ViewModel and tries to load the last opened file
  Future<void> initialize() async {
    final lastFilePath = await _storageService.getLastOpenedFilePath();
    if (lastFilePath != null && lastFilePath.isNotEmpty) {
      await loadFile(lastFilePath);
    }
  }

  /// Picks a logcat file using the system picker and loads it
  Future<void> pickAndLoadFile() async {
    try {
      _setLoading(true);
      _setError(null);

      // Pick file
      final filePath = await _filePickerService.pickLogcatFile();
      if (filePath == null) {
        // User cancelled
        _setLoading(false);
        return;
      }

      // Load the file
      await loadFile(filePath);
    } catch (e) {
      _setError(e.toString());
      _setLoading(false);
    }
  }

  /// Loads a specific file by its [filePath]
  ///
  /// Parses the file, updates the state, and saves it to history
  Future<void> loadFile(String filePath) async {
    try {
      _setLoading(true);
      _setError(null);

      // Parse file
      _logFile = await _parserService.parseLogFile(filePath);

      // Save current file path
      _currentFilePath = filePath;

      // Save as last opened file and add to history
      await _storageService.setLastOpenedFilePath(filePath);
      await _storageService.addFileToHistory(filePath);

      // Apply current filter
      _applyFilter();

      _setLoading(false);
    } catch (e) {
      _setError(e.toString());
      _setLoading(false);
    }
  }

  /// Updates the filter text and re-filters the logs
  void updateFilter(String filter) {
    _filterText = filter;
    _applyFilter();
  }

  /// Clears the current filter
  void clearFilter() {
    _filterText = '';
    _applyFilter();
  }

  /// Apply current filter to logs
  void _applyFilter() {
    if (_logFile == null) {
      _filteredLogs = [];
    } else {
      _filteredLogs = _logFile!.getFilteredMessages(_filterText);
    }
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    _error = value;
    notifyListeners();
  }
}
