import 'package:flutter/material.dart';

/// Light theme colors based on green and yellow palette
class AppColorsLight {
  // Primary colors (Green)
  static const primary = Color(0xFF16A34A); // Vibrant green
  static const onPrimary = Color(0xFFFFFFFF); // White
  static const primaryContainer = Color(0xFFBBF7D0); // Light green
  static const onPrimaryContainer = Color(0xFF064E3B); // Dark green

  // Secondary colors (Yellow/Amber)
  static const secondary = Color(0xFFF59E0B); // Amber
  static const onSecondary = Color(0xFF000000); // Black
  static const secondaryContainer = Color(0xFFFEF3C7); // Light amber
  static const onSecondaryContainer = Color(0xFF78350F); // Dark amber

  // Tertiary colors (Teal)
  static const tertiary = Color(0xFF0D9488); // Teal
  static const onTertiary = Color(0xFFFFFFFF); // White
  static const tertiaryContainer = Color(0xFFCCFBF1); // Light teal
  static const onTertiaryContainer = Color(0xFF134E4A); // Dark teal

  // Error colors
  static const error = Color(0xFFDC2626); // Red
  static const onError = Color(0xFFFFFFFF); // White
  static const errorContainer = Color(0xFFFEE2E2); // Light red
  static const onErrorContainer = Color(0xFF7F1D1D); // Dark red

  // Surface colors
  static const surface = Color(0xFFFFFFFF); // White
  static const onSurface = Color(0xFF1F2937); // Dark gray
  static const surfaceVariant = Color(0xFFF3F4F6); // Light gray
  static const onSurfaceVariant = Color(0xFF4B5563); // Medium gray
  static const surfaceTint = Color(0xFF16A34A); // Primary green

  // Background colors
  static const background = Color(0xFFF9FAFB); // Very light gray
  static const onBackground = Color(0xFF1F2937); // Dark gray

  // Outline colors
  static const outline = Color(0xFFD1D5DB); // Gray
  static const outlineVariant = Color(0xFFE5E7EB); // Light gray

  // Inverse colors
  static const inverseSurface = Color(0xFF1F2937); // Dark gray
  static const onInverseSurface = Color(0xFFF9FAFB); // Light gray
  static const inversePrimary = Color(0xFF86EFAC); // Light green

  // Shadow and scrim
  static const shadow = Color(0xFF000000); // Black
  static const scrim = Color(0xFF000000); // Black

  // Log level colors (Light theme)
  static const logVerbose = Color(0xFF6B7280); // Gray
  static const logDebug = Color(0xFF3B82F6); // Blue
  static const logInfo = Color(0xFF059669); // Green
  static const logWarning = Color(0xFFF59E0B); // Amber
  static const logError = Color(0xFFDC2626); // Red
  static const logAssert = Color(0xFF7C3AED); // Purple
}

/// Dark theme colors based on green and yellow palette
class AppColorsDark {
  // Primary colors (Green)
  static const primary = Color(0xFF22C55E); // Bright green
  static const onPrimary = Color(0xFF052E16); // Very dark green
  static const primaryContainer = Color(0xFF15803D); // Medium green
  static const onPrimaryContainer = Color(0xFFBBF7D0); // Light green

  // Secondary colors (Yellow/Amber)
  static const secondary = Color(0xFFFCD34D); // Soft yellow
  static const onSecondary = Color(0xFF451A03); // Very dark amber
  static const secondaryContainer = Color(0xFFB45309); // Medium amber
  static const onSecondaryContainer = Color(0xFFFEF3C7); // Light amber

  // Tertiary colors (Teal)
  static const tertiary = Color(0xFF14B8A6); // Bright teal
  static const onTertiary = Color(0xFF042F2E); // Very dark teal
  static const tertiaryContainer = Color(0xFF0F766E); // Medium teal
  static const onTertiaryContainer = Color(0xFFCCFBF1); // Light teal

  // Error colors
  static const error = Color(0xFFF87171); // Light red
  static const onError = Color(0xFF450A0A); // Very dark red
  static const errorContainer = Color(0xFF991B1B); // Medium red
  static const onErrorContainer = Color(0xFFFEE2E2); // Light red

  // Surface colors
  static const surface = Color(0xFF1F2937); // Dark gray
  static const onSurface = Color(0xFFE5E7EB); // Light gray
  static const surfaceVariant = Color(0xFF374151); // Medium dark gray
  static const onSurfaceVariant = Color(0xFFD1D5DB); // Light gray
  static const surfaceTint = Color(0xFF22C55E); // Primary green

  // Background colors
  static const background = Color(0xFF111827); // Very dark gray
  static const onBackground = Color(0xFFE5E7EB); // Light gray

  // Outline colors
  static const outline = Color(0xFF4B5563); // Medium gray
  static const outlineVariant = Color(0xFF374151); // Dark gray

  // Inverse colors
  static const inverseSurface = Color(0xFFE5E7EB); // Light gray
  static const onInverseSurface = Color(0xFF1F2937); // Dark gray
  static const inversePrimary = Color(0xFF16A34A); // Green

  // Shadow and scrim
  static const shadow = Color(0xFF000000); // Black
  static const scrim = Color(0xFF000000); // Black

  // Log level colors (Dark theme)
  static const logVerbose = Color(0xFF9CA3AF); // Light gray
  static const logDebug = Color(0xFF60A5FA); // Light blue
  static const logInfo = Color(0xFF34D399); // Light green
  static const logWarning = Color(0xFFFCD34D); // Yellow
  static const logError = Color(0xFFF87171); // Light red
  static const logAssert = Color(0xFFA78BFA); // Light purple
}
