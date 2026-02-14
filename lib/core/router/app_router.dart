import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/presentation/widgets/presentation_screen.dart';
import '../../features/presentation/view_models/presentation_viewmodel.dart';
import '../../features/splash/widgets/splash_screen.dart';
import '../../features/splash/view_models/splash_viewmodel.dart';

abstract final class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String presentation = '/presentation';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.splash,
      builder: (BuildContext context, GoRouterState state) {
        return SplashScreen(
          viewModel: SplashViewModel(
            onComplete: () => context.go(AppRoutes.presentation),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.presentation,
      builder: (BuildContext context, GoRouterState state) {
        return PresentationScreen(viewModel: PresentationViewModel());
      },
    ),
  ],
);
