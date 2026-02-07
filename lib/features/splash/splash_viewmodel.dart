import 'package:flutter/foundation.dart';

/// ViewModel da tela inicial de apresentação (splash).
///
/// Responsável pelo estado da UI desta feature: expõe dados que a [SplashScreen]
/// precisa para desenhar (ex.: caminho da logo). Não conhece widgets.
/// [ChangeNotifier] permite notificar a View quando o estado mudar (ex.: ao
/// decidir navegar para login).
class SplashViewModel extends ChangeNotifier {
  static const String logoAssetPath = 'assets/images/naturalis_logo_sem_bg.png';
}
