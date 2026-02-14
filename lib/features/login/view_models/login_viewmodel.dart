import 'package:flutter/foundation.dart';

/// ViewModel da tela de login (apenas UI; lógica de negócio virá depois).
class LoginViewModel extends ChangeNotifier {
  LoginViewModel({
    VoidCallback? onBackPressed,
    VoidCallback? onForgotPassword,
    VoidCallback? onLoginPressed,
    VoidCallback? onSignInWithGoogle,
    VoidCallback? onSignInWithApple,
    VoidCallback? onSignUpPressed,
  }) : _onBackPressed = onBackPressed,
       _onForgotPassword = onForgotPassword,
       _onLoginPressed = onLoginPressed,
       _onSignInWithGoogle = onSignInWithGoogle,
       _onSignInWithApple = onSignInWithApple,
       _onSignUpPressed = onSignUpPressed;

  final VoidCallback? _onBackPressed;
  final VoidCallback? _onForgotPassword;
  final VoidCallback? _onLoginPressed;
  final VoidCallback? _onSignInWithGoogle;
  final VoidCallback? _onSignInWithApple;
  final VoidCallback? _onSignUpPressed;

  void onBackPressed() => _onBackPressed?.call();
  void onForgotPassword() => _onForgotPassword?.call();
  void onLoginPressed() => _onLoginPressed?.call();
  void onSignInWithGoogle() => _onSignInWithGoogle?.call();
  void onSignInWithApple() => _onSignInWithApple?.call();
  void onSignUpPressed() => _onSignUpPressed?.call();
}
