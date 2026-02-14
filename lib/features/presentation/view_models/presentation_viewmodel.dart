import 'package:flutter/foundation.dart';

class PresentationViewModel extends ChangeNotifier {
  PresentationViewModel({
    VoidCallback? onLoginPressed,
    VoidCallback? onSignUpPressed,
  }) : _onLoginPressed = onLoginPressed,
       _onSignUpPressed = onSignUpPressed;

  final VoidCallback? _onLoginPressed;
  final VoidCallback? _onSignUpPressed;

  void onLoginPressed() => _onLoginPressed?.call();
  void onSignUpPressed() => _onSignUpPressed?.call();
}
