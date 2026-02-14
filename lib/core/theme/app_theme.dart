import 'package:flutter/material.dart';
import 'package:recarga/core/theme/app_colors.dart';

abstract final class AppFonts {
  AppFonts._();
  static const String display = 'Bungee';
  static const String body = 'OpenSans';
  static const String subtitle = 'Saira';
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
    textTheme: ThemeData.light().textTheme.apply(fontFamily: AppFonts.body),
  );
}
