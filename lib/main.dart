import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/splash/splash_screen.dart';
import 'features/splash/splash_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final splashViewModel = SplashViewModel();

    return MaterialApp(
      title: 'Neuralis',
      theme: AppTheme.light,
      home: SplashScreen(viewModel: splashViewModel),
    );
  }
}
