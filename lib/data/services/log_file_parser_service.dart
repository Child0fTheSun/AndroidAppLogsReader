import 'dart:convert';
import 'dart:io';
import 'package:as_app_logs_reader/data/models/log_file.dart';

/// Service for parsing log files
class LogFileParserService {
  /// Parses a `.logcat` file from the given [filePath]
  ///
  /// Reads the file content as a JSON string and converts it into a [LogFile] object
  ///
  /// Throws an [Exception] if:
  /// - The file does not exist
  /// - The file content is not valid JSON
  /// - The file cannot be read
  /// - The JSON structure does not match the expected [LogFile] format
  Future<LogFile> parseLogFile(String filePath) async {
    try {
      // Read file
      final file = File(filePath);
      if (!await file.exists()) {
        throw Exception('File not found: $filePath');
      }

      // Read and parse JSON
      final jsonString = await file.readAsString();
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;

      // Parse into LogFile object
      return LogFile.fromJson(jsonData);
    } on FormatException catch (e) {
      throw Exception('Invalid JSON format: $e');
    } on IOException catch (e) {
      throw Exception('Failed to read file: $e');
    } catch (e) {
      throw Exception('Failed to parse log file: $e');
    }
  }
}
