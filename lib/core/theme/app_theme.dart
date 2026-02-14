import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Nomes das fontes declaradas no pubspec (single source of truth para uso na UI).
abstract final class AppFonts {
  AppFonts._();
  static const String display = 'Bungee';
  static const String body = 'OpenSans';
}

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
    textTheme: ThemeData.light()
        .textTheme
        .apply(fontFamily: AppFonts.body),
  );
}
