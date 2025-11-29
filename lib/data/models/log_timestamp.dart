/// Represents a timestamp in logcat format
class LogTimestamp {
  /// Seconds part of the timestamp
  final int seconds;

  /// Nanoseconds part of the timestamp
  final int nanos;

  const LogTimestamp({required this.seconds, required this.nanos});

  /// Parse from JSON
  factory LogTimestamp.fromJson(Map<String, dynamic> json) {
    return LogTimestamp(
      seconds: json['seconds'] as int? ?? 0,
      nanos: json['nanos'] as int? ?? 0,
    );
  }

  /// Convert to DateTime
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(
      seconds * 1000 + (nanos ~/ 1000000),
    );
  }

  /// Format as readable string
  String format() {
    final dt = toDateTime();
    return '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}:'
        '${dt.second.toString().padLeft(2, '0')}.'
        '${(nanos ~/ 1000000).toString().padLeft(3, '0')}';
  }

  @override
  String toString() => format();
}
