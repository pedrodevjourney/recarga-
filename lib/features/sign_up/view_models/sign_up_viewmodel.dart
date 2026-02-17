import 'package:flutter/foundation.dart';
import 'package:recarga/core/network/repository_providers.dart';
import 'package:recarga/features/sign_up/data/register_repository.dart';
import 'package:recarga/features/sign_up/data/register_request.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({
    RegisterRepository? registerRepository,
    VoidCallback? onBackPressed,
    VoidCallback? onRegisterSuccess,
  }) : _registerRepository = registerRepository ?? getRegisterRepository(),
       _onBackPressed = onBackPressed,
       _onRegisterSuccess = onRegisterSuccess;

  final RegisterRepository _registerRepository;
  final VoidCallback? _onBackPressed;
  final VoidCallback? _onRegisterSuccess;

  bool _agreeToTerms = false;
  bool get agreeToTerms => _agreeToTerms;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setAgreeToTerms(bool value) {
    if (_agreeToTerms == value) return;
    _agreeToTerms = value;
    notifyListeners();
  }

  void onBackPressed() => _onBackPressed?.call();

  Future<void> register(String fullName, String email, String password) async {
    _errorMessage = null;
    _isLoading = true;
    notifyListeners();

    try {
      await _registerRepository.register(
        RegisterRequest(
          fullName: fullName.trim(),
          email: email.trim(),
          password: password,
        ),
      );
      _isLoading = false;
      _errorMessage = null;
      notifyListeners();
      _onRegisterSuccess?.call();
    } on RegisterFailure catch (e) {
      _isLoading = false;
      _errorMessage = e.message;
      notifyListeners();
    }
  }
}
