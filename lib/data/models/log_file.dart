import 'package:as_app_logs_reader/data/models/log_entry.dart';

/// Represents device metadata from logcat file
class DeviceMetadata {
  /// Unique identifier of the device
  final String deviceId;

  /// Human-readable name of the device
  final String name;

  /// Device serial number
  final String serialNumber;

  /// Whether the device is currently online/connected
  final bool isOnline;

  /// Android release version (e.g., "11", "12")
  final String release;

  /// Android SDK version (API level)
  final int sdk;

  /// Device model name
  final String model;

  /// Whether the device is an emulator
  final bool isEmulator;

  const DeviceMetadata({
    required this.deviceId,
    required this.name,
    required this.serialNumber,
    required this.isOnline,
    required this.release,
    required this.sdk,
    required this.model,
    required this.isEmulator,
  });

  factory DeviceMetadata.fromJson(Map<String, dynamic> json) {
    return DeviceMetadata(
      deviceId: json['deviceId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      serialNumber: json['serialNumber'] as String? ?? '',
      isOnline: json['isOnline'] as bool? ?? false,
      release: json['release'] as String? ?? '',
      sdk: json['sdk'] as int? ?? 0,
      model: json['model'] as String? ?? '',
      isEmulator: json['isEmulator'] as bool? ?? false,
    );
  }
}

/// Represents metadata from logcat file
class LogMetadata {
  /// The device information associated with the logs
  final DeviceMetadata device;

  /// The filter string used when capturing the logs
  final String filter;

  /// List of application IDs that belong to the project
  final List<String> projectApplicationIds;

  const LogMetadata({
    required this.device,
    required this.filter,
    required this.projectApplicationIds,
  });

  factory LogMetadata.fromJson(Map<String, dynamic> json) {
    return LogMetadata(
      device: DeviceMetadata.fromJson(
        json['device'] as Map<String, dynamic>? ?? {},
      ),
      filter: json['filter'] as String? ?? '',
      projectApplicationIds:
          (json['projectApplicationIds'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}

/// Represents a complete logcat file
class LogFile {
  /// Metadata about the log file and device
  final LogMetadata metadata;

  /// The list of log messages contained in the file
  final List<LogEntry> messages;

  const LogFile({required this.metadata, required this.messages});

  factory LogFile.fromJson(Map<String, dynamic> json) {
    return LogFile(
      metadata: LogMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>? ?? {},
      ),
      messages:
          (json['logcatMessages'] as List<dynamic>?)
              ?.map((e) => LogEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  /// Get filtered messages
  List<LogEntry> getFilteredMessages(String filter) {
    if (filter.isEmpty) return messages;
    return messages.where((entry) => entry.matches(filter)).toList();
  }
}
