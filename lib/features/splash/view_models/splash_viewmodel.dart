import 'package:flutter/foundation.dart';

/// ViewModel da tela inicial de apresentação (splash).
///
/// Expõe dados para a [SplashScreen] e, após [displayDuration], chama
/// [onComplete]. Não conhece navegação: quem cria o ViewModel injeta o callback.
class SplashViewModel extends ChangeNotifier {
  static const String logoAssetPath = 'assets/images/recarga_vermelho_sem_bg.png';

  /// Tempo que a splash fica visível antes de chamar [onComplete].
  static const Duration displayDuration = Duration(seconds: 3);

  SplashViewModel({VoidCallback? onComplete}) {
    Future.delayed(displayDuration, () => onComplete?.call());
  }
}
