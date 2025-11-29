import 'dart:io';

import 'package:as_app_logs_reader/core/di/service_locator.dart';
import 'package:as_app_logs_reader/data/services/storage_service.dart';
import 'package:flutter/material.dart';

class HistoryScreenViewModel extends ChangeNotifier {
  final _storageService = getIt<StorageService>();

  // State
  List<String> _fileHistory = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<String> get fileHistory => _fileHistory;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasHistory => _fileHistory.isNotEmpty;

  /// Initialize and load file history
  Future<void> initialize() async {
    await loadHistory();
  }

  /// Load file history from storage
  Future<void> loadHistory() async {
    try {
      _setLoading(true);
      _setError(null);

      _fileHistory = await _storageService.getFileHistory();

      _setLoading(false);
    } catch (e) {
      _setError(e.toString());
      _setLoading(false);
    }
  }

  /// Check if file exists and return true if exists, false otherwise
  Future<bool> checkFileExists(String filePath) async {
    final file = File(filePath);
    return await file.exists();
  }

  /// Remove file from history
  Future<void> removeFromHistory(String filePath) async {
    try {
      await _storageService.removeFileFromHistory(filePath);
      _fileHistory.remove(filePath);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    }
  }

  /// Clear all history
  Future<void> clearHistory() async {
    try {
      await _storageService.clearFileHistory();
      _fileHistory.clear();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    }
  }

  /// Get file name from path
  String getFileName(String filePath) {
    return filePath.split('\\').last.split('/').last;
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
