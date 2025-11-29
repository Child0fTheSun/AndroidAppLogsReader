import 'package:flutter/material.dart';

/// Enum representing log levels in Android logcat
enum LogLevel {
  /// Verbose level (lowest priority)
  verbose('VERBOSE', 'V'),

  /// Debug level
  debug('DEBUG', 'D'),

  /// Info level
  info('INFO', 'I'),

  /// Warning level
  warn('WARN', 'W'),

  /// Error level
  error('ERROR', 'E'),

  /// Assert level (highest priority)
  assert_('ASSERT', 'A');

  /// The full name of the log level (e.g., "VERBOSE")
  final String name;

  /// The short abbreviation of the log level (e.g., "V")
  final String shortName;

  const LogLevel(this.name, this.shortName);

  /// Parse log level from string
  static LogLevel fromString(String value) {
    switch (value.toUpperCase()) {
      case 'VERBOSE':
      case 'V':
        return LogLevel.verbose;
      case 'DEBUG':
      case 'D':
        return LogLevel.debug;
      case 'INFO':
      case 'I':
        return LogLevel.info;
      case 'WARN':
      case 'WARNING':
      case 'W':
        return LogLevel.warn;
      case 'ERROR':
      case 'E':
        return LogLevel.error;
      case 'ASSERT':
      case 'A':
        return LogLevel.assert_;
      default:
        return LogLevel.info;
    }
  }

  /// Get default color for this log level
  Color getDefaultColor() {
    switch (this) {
      case LogLevel.verbose:
        return Colors.grey;
      case LogLevel.debug:
        return Colors.blue;
      case LogLevel.info:
        return Colors.green;
      case LogLevel.warn:
        return Colors.orange;
      case LogLevel.error:
        return Colors.red;
      case LogLevel.assert_:
        return Colors.purple;
    }
  }

  /// Get priority for filtering (higher = more important)
  int get priority {
    switch (this) {
      case LogLevel.verbose:
        return 0;
      case LogLevel.debug:
        return 1;
      case LogLevel.info:
        return 2;
      case LogLevel.warn:
        return 3;
      case LogLevel.error:
        return 4;
      case LogLevel.assert_:
        return 5;
    }
  }
}
