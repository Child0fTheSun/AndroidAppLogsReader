import 'package:as_app_logs_reader/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ColorSchemes {
  /// Light color scheme based on green and yellow palette
  static ColorScheme lightScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: AppColorsLight.primary,
      onPrimary: AppColorsLight.onPrimary,
      primaryContainer: AppColorsLight.primaryContainer,
      onPrimaryContainer: AppColorsLight.onPrimaryContainer,
      secondary: AppColorsLight.secondary,
      onSecondary: AppColorsLight.onSecondary,
      secondaryContainer: AppColorsLight.secondaryContainer,
      onSecondaryContainer: AppColorsLight.onSecondaryContainer,
      tertiary: AppColorsLight.tertiary,
      onTertiary: AppColorsLight.onTertiary,
      tertiaryContainer: AppColorsLight.tertiaryContainer,
      onTertiaryContainer: AppColorsLight.onTertiaryContainer,
      error: AppColorsLight.error,
      onError: AppColorsLight.onError,
      errorContainer: AppColorsLight.errorContainer,
      onErrorContainer: AppColorsLight.onErrorContainer,
      surface: AppColorsLight.surface,
      onSurface: AppColorsLight.onSurface,
      onSurfaceVariant: AppColorsLight.onSurfaceVariant,
      outline: AppColorsLight.outline,
      outlineVariant: AppColorsLight.outlineVariant,
      shadow: AppColorsLight.shadow,
      scrim: AppColorsLight.scrim,
      inverseSurface: AppColorsLight.inverseSurface,
      onInverseSurface: AppColorsLight.onInverseSurface,
      inversePrimary: AppColorsLight.inversePrimary,
      surfaceTint: AppColorsLight.surfaceTint,
    );
  }

  /// Dark color scheme based on green and yellow palette
  static ColorScheme darkScheme() {
    return ColorScheme(
      brightness: Brightness.dark,
      primary: AppColorsDark.primary,
      onPrimary: AppColorsDark.onPrimary,
      primaryContainer: AppColorsDark.primaryContainer,
      onPrimaryContainer: AppColorsDark.onPrimaryContainer,
      secondary: AppColorsDark.secondary,
      onSecondary: AppColorsDark.onSecondary,
      secondaryContainer: AppColorsDark.secondaryContainer,
      onSecondaryContainer: AppColorsDark.onSecondaryContainer,
      tertiary: AppColorsDark.tertiary,
      onTertiary: AppColorsDark.onTertiary,
      tertiaryContainer: AppColorsDark.tertiaryContainer,
      onTertiaryContainer: AppColorsDark.onTertiaryContainer,
      error: AppColorsDark.error,
      onError: AppColorsDark.onError,
      errorContainer: AppColorsDark.errorContainer,
      onErrorContainer: AppColorsDark.onErrorContainer,
      surface: AppColorsDark.surface,
      onSurface: AppColorsDark.onSurface,
      onSurfaceVariant: AppColorsDark.onSurfaceVariant,
      outline: AppColorsDark.outline,
      outlineVariant: AppColorsDark.outlineVariant,
      shadow: AppColorsDark.shadow,
      scrim: AppColorsDark.scrim,
      inverseSurface: AppColorsDark.inverseSurface,
      onInverseSurface: AppColorsDark.onInverseSurface,
      inversePrimary: AppColorsDark.inversePrimary,
      surfaceTint: AppColorsDark.surfaceTint,
    );
  }
}
