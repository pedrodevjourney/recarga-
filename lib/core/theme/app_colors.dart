import 'package:flutter/material.dart';

/// Cores principais do app (single source of truth).
/// Usadas por [AppTheme]; a UI deve preferir [Theme.of(context).colorScheme].
abstract final class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF880808);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF000000);
  static const Color surface = Color(0xFFFBF9F9);
}
