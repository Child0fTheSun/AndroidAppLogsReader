import 'package:as_app_logs_reader/data/models/log_level.dart';
import 'package:as_app_logs_reader/data/models/log_timestamp.dart';

/// Represents a single log entry from logcat
class LogEntry {
  /// The log level (e.g., INFO, DEBUG, ERROR)
  final LogLevel logLevel;

  /// Process ID that generated the log
  final int pid;

  /// Thread ID that generated the log
  final int tid;

  /// The application ID (package name) associated with the log
  final String applicationId;

  /// The name of the process
  final String processName;

  /// The tag identifying the source of the log message
  final String tag;

  /// The timestamp when the log was created
  final LogTimestamp timestamp;

  /// The actual log message content
  final String message;

  const LogEntry({
    required this.logLevel,
    required this.pid,
    required this.tid,
    required this.applicationId,
    required this.processName,
    required this.tag,
    required this.timestamp,
    required this.message,
  });

  /// Parse from JSON
  factory LogEntry.fromJson(Map<String, dynamic> json) {
    final header = json['header'] as Map<String, dynamic>? ?? {};

    return LogEntry(
      logLevel: LogLevel.fromString(header['logLevel'] as String? ?? 'INFO'),
      pid: header['pid'] as int? ?? 0,
      tid: header['tid'] as int? ?? 0,
      applicationId: header['applicationId'] as String? ?? '',
      processName: header['processName'] as String? ?? '',
      tag: header['tag'] as String? ?? '',
      timestamp: LogTimestamp.fromJson(
        header['timestamp'] as Map<String, dynamic>? ?? {},
      ),
      message: json['message'] as String? ?? '',
    );
  }

  /// Check if entry matches filter text
  bool matches(String filter) {
    if (filter.isEmpty) return true;

    final lowerFilter = filter.toLowerCase();

    // Check for specific filters
    if (lowerFilter.startsWith('package:')) {
      final packageName = lowerFilter.substring(8).trim();
      return applicationId.toLowerCase().contains(packageName);
    }

    if (lowerFilter.startsWith('tag:')) {
      final tagName = lowerFilter.substring(4).trim();
      return tag.toLowerCase().contains(tagName);
    }

    // Default: search in message
    return message.toLowerCase().contains(lowerFilter) ||
        tag.toLowerCase().contains(lowerFilter) ||
        applicationId.toLowerCase().contains(lowerFilter);
  }

  @override
  String toString() {
    return '${timestamp.format()} ${logLevel.shortName}/$tag($pid:$tid): $message';
  }
}
