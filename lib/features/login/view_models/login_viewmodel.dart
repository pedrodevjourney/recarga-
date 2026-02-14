import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:recarga/core/config/api_config.dart';
import 'package:recarga/features/login/data/login_repository.dart';
import 'package:recarga/features/login/data/login_request.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({
    LoginRepository? loginRepository,
    VoidCallback? onBackPressed,
    VoidCallback? onForgotPassword,
    VoidCallback? onLoginSuccess,
    VoidCallback? onSignInWithGoogle,
    VoidCallback? onSignInWithApple,
    VoidCallback? onSignUpPressed,
  }) : _loginRepository =
           loginRepository ??
           LoginRepository(Dio(BaseOptions(baseUrl: ApiConfig.baseUrl))),
       _onBackPressed = onBackPressed,
       _onForgotPassword = onForgotPassword,
       _onLoginSuccess = onLoginSuccess,
       _onSignInWithGoogle = onSignInWithGoogle,
       _onSignInWithApple = onSignInWithApple,
       _onSignUpPressed = onSignUpPressed;

  final LoginRepository _loginRepository;
  final VoidCallback? _onBackPressed;
  final VoidCallback? _onForgotPassword;
  final VoidCallback? _onLoginSuccess;
  final VoidCallback? _onSignInWithGoogle;
  final VoidCallback? _onSignInWithApple;
  final VoidCallback? _onSignUpPressed;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void onBackPressed() => _onBackPressed?.call();
  void onForgotPassword() => _onForgotPassword?.call();
  void onSignInWithGoogle() => _onSignInWithGoogle?.call();
  void onSignInWithApple() => _onSignInWithApple?.call();
  void onSignUpPressed() => _onSignUpPressed?.call();

  Future<void> login(String email, String password) async {
    _errorMessage = null;
    _isLoading = true;
    notifyListeners();

    try {
      await _loginRepository.login(
        LoginRequest(email: email.trim(), password: password),
      );
      _isLoading = false;
      _errorMessage = null;
      notifyListeners();
      _onLoginSuccess?.call();
    } on LoginFailure catch (e) {
      _isLoading = false;
      _errorMessage = e.message;
      notifyListeners();
    }
  }
}
