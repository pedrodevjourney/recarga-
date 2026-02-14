import 'package:flutter/foundation.dart';

class PresentationViewModel extends ChangeNotifier {
  PresentationViewModel({
    VoidCallback? onLoginPressed,
    VoidCallback? onSignUpPressed,
  }) : _onLoginPressed = onLoginPressed,
       _onSignUpPressed = onSignUpPressed;

  final VoidCallback? _onLoginPressed;
  final VoidCallback? _onSignUpPressed;

  static const String loginButtonLabel = 'Entrar';

  static const String signUpButtonLabel = 'Fazer Cadastro';

  /// Início da frase hero (antes da palavra animada).
  static const String heroSentencePrefix = 'A forma mais inteligente de ';

  /// Fim da frase hero (depois da palavra animada). Sem espaço à esquerda
  /// para que, ao quebrar linha, "seu" alinhe com o início da primeira linha.
  static const String heroSentenceSuffix = 'seu carro elétrico.';

  /// Palavras que alternam com efeito rewrite no meio da frase.
  static const List<String> heroWords = ['encontrar', 'agendar', 'carregar'];

  void onLoginPressed() => _onLoginPressed?.call();
  void onSignUpPressed() => _onSignUpPressed?.call();
}
