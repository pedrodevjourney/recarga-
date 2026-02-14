/// Configuração da API (base URL). Use HTTPS em produção.
abstract final class ApiConfig {
  ApiConfig._();

  /// IP da sua máquina na rede. Dispositivo físico e simulador iOS usam esse IP.
  /// Emulador Android use http://10.0.2.2:8080
  static const String baseUrl = 'http://192.168.3.14:8080';
}
