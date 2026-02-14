import 'package:flutter/material.dart';
import 'package:recarga/features/splash/view_models/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required this.viewModel});

  final SplashViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: colorScheme.onPrimary,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Image.asset(
                  SplashViewModel.logoAssetPath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
