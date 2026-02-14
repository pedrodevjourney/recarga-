import 'package:flutter/foundation.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({VoidCallback? onBackPressed})
    : _onBackPressed = onBackPressed;

  final VoidCallback? _onBackPressed;

  bool _agreeToTerms = false;
  bool get agreeToTerms => _agreeToTerms;

  void setAgreeToTerms(bool value) {
    if (_agreeToTerms == value) return;
    _agreeToTerms = value;
    notifyListeners();
  }

  void onBackPressed() => _onBackPressed?.call();
}
