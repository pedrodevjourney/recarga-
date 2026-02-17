import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recarga/core/network/repository_providers.dart';
import 'package:recarga/features/login/view_models/login_viewmodel.dart';
import 'package:recarga/features/login/widgets/login_screen.dart';
import 'package:recarga/features/presentation/view_models/presentation_viewmodel.dart';
import 'package:recarga/features/presentation/widgets/presentation_screen.dart';
import 'package:recarga/features/sign_up/view_models/sign_up_viewmodel.dart';
import 'package:recarga/features/sign_up/widgets/sign_up_screen.dart';
import 'package:recarga/features/splash/view_models/splash_viewmodel.dart';
import 'package:recarga/features/splash/widgets/splash_screen.dart';

abstract final class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String presentation = '/presentation';
  static const String login = '/login';
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
            onLoginPressed: () => context.push(AppRoutes.login),
            onSignUpPressed: () => context.push(AppRoutes.signUp),
          ),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen(
          viewModel: LoginViewModel(
            loginRepository: getLoginRepository(),
            onBackPressed: () => context.pop(),
            onForgotPassword: () {},
            onLoginSuccess: () => context.pop(),
            onSignInWithGoogle: () {},
            onSignInWithApple: () {},
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
            registerRepository: getRegisterRepository(),
            onBackPressed: () => context.pop(),
            onRegisterSuccess: () => context.pop(),
          ),
        );
      },
    ),
  ],
);
