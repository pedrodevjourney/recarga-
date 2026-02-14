import 'package:flutter/foundation.dart';

/// ViewModel da tela de cadastro (apenas UI; lógica de negócio virá depois).
/// Segue o padrão sugerido pela documentação Flutter (ChangeNotifier).
class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({VoidCallback? onBackPressed})
    : _onBackPressed = onBackPressed;

  final VoidCallback? _onBackPressed;

  static const String screenTitle = 'Fazer cadastro';
  static const String headline = 'Crie sua conta';
  static const String subtext =
      'Feito para donos de carros elétricos. Agende carregamentos e gerencie sua rotina na palma da mão.';
  static const String fullNameLabel = 'Nome completo';
  static const String fullNameHint = 'Digite seu nome';
  static const String emailLabel = 'E-mail';
  static const String emailHint = 'exemplo@email.com';
  static const String passwordLabel = 'Senha';
  static const String passwordHint = 'Mínimo 8 caracteres';
  static const String termsCheckboxLabel =
      'Concordo com os termos de uso e política de privacidade.';
  static const String submitButtonLabel = 'Cadastrar';

  bool _agreeToTerms = false;
  bool get agreeToTerms => _agreeToTerms;

  void setAgreeToTerms(bool value) {
    if (_agreeToTerms == value) return;
    _agreeToTerms = value;
    notifyListeners();
  }

  void onBackPressed() => _onBackPressed?.call();
}
