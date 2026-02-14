import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/presentation/widgets/presentation_screen.dart';
import '../../features/presentation/view_models/presentation_viewmodel.dart';
import '../../features/sign_up/view_models/sign_up_viewmodel.dart';
import '../../features/sign_up/widgets/sign_up_screen.dart';
import '../../features/splash/widgets/splash_screen.dart';
import '../../features/splash/view_models/splash_viewmodel.dart';

abstract final class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String presentation = '/presentation';
  static const String signUp = '/cadastro';
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
        return PresentationScreen(
          viewModel: PresentationViewModel(
            onSignUpPressed: () => context.push(AppRoutes.signUp),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.signUp,
      builder: (BuildContext context, GoRouterState state) {
        return SignUpScreen(
          viewModel: SignUpViewModel(
            onBackPressed: () => context.pop(),
          ),
        );
      },
    ),
  ],
);
