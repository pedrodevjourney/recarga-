import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Tema do app. Usar em [MaterialApp.theme].
abstract final class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      surface: AppColors.surface,
      onSurface: AppColors.secondary,
    ),
    useMaterial3: true,
  );
}
