import 'package:as_app_logs_reader/data/models/log_entry.dart';
import 'package:as_app_logs_reader/core/utils/s.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Widget to display a single log entry.
///
/// Renders the log level, timestamp, tag, process info, and message content.
/// Supports copying the message to clipboard on tap.
class LogEntryWidget extends StatelessWidget {
  final LogEntry entry;

  const LogEntryWidget({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final logColor = entry.logLevel.getDefaultColor();
    final localizations = S.of(context);

    return InkWell(
      onTap: () {
        // Copy log entry to clipboard
        Clipboard.setData(ClipboardData(text: entry.message));

        // Show feedback
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(localizations.copiedToClipboard),
            duration: Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
            width: 250,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Log level indicator
                Container(
                  width: 4,
                  height: 20,
                  decoration: BoxDecoration(
                    color: logColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),

                // Log content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header: timestamp, level, tag
                      Row(
                        children: [
                          // Timestamp
                          Text(
                            entry.timestamp.format(),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontFamily: 'monospace',
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Log level badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: logColor.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              entry.logLevel.shortName,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: logColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Tag only
                          if (entry.tag.isNotEmpty)
                            Expanded(
                              child: Text(
                                entry.tag,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: logColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      // Process info (pid-tid) and package name
                      Row(
                        children: [
                          if (entry.pid > 0 || entry.tid > 0)
                            Text(
                              '${entry.pid}-${entry.tid}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                                fontFamily: 'monospace',
                              ),
                            ),

                          // Spacing if both pid:tid and package name exist
                          if ((entry.pid > 0 || entry.tid > 0) &&
                              entry.applicationId.isNotEmpty)
                            const SizedBox(width: 8),

                          // Package name
                          if (entry.applicationId.isNotEmpty)
                            Expanded(
                              child: Text(
                                entry.applicationId,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurface,
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      // Message with log level color
                      Text(
                        entry.message,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontFamily: 'monospace',
                          color: logColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(height: 1, thickness: 0.5),
          ],
        ),
      ),
    );
  }
}
