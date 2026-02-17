/// Exceção genérica da camada de rede. Implementações (ex.: Dio) mapeiam
/// suas próprias exceções para [ApiException]; o resto do app não conhece Dio.
class ApiException implements Exception {
  ApiException(this.message, [this.statusCode]);

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}

/// Contrato do cliente HTTP. A implementação (ex.: Dio) fica só na camada de
/// rede; repositórios e domínio dependem só deste contrato.
abstract interface class HttpClient {
  Future<Map<String, dynamic>?> post(
    String path, {
    Map<String, dynamic>? data,
  });
}
