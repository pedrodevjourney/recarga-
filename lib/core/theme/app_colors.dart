import 'package:flutter/material.dart';

/// Cores principais do app (single source of truth).
/// Usadas por [AppTheme]; a UI deve preferir [Theme.of(context).colorScheme].
abstract final class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFC91F1C);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF160404);
  static const Color surface = Color(0xFFFBF9F9);
}
