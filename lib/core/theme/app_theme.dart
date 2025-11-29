import 'package:as_app_logs_reader/core/theme/app_text_theme.dart';
import 'package:as_app_logs_reader/core/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static TextTheme get textTheme => AppTextTheme.textTheme();

  /// Light theme configuration
  static ThemeData get lightTheme {
    final scheme = ColorSchemes.lightScheme();

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      textTheme: textTheme.apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface,
      ),
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.onSurface,
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    final scheme = ColorSchemes.darkScheme();

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      textTheme: textTheme.apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface,
      ),
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.onSurface,
    );
  }
}
