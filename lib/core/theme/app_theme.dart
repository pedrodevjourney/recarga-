import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      surface: AppColors.secondary,
      onSurface: AppColors.onPrimary,
    ),
    useMaterial3: true,
  );
}
