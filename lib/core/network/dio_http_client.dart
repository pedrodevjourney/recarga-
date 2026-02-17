import 'package:dio/dio.dart';

import 'package:recarga/core/network/http_client.dart';
import 'package:recarga/core/utils/response_error.dart';

/// Implementação de [HttpClient] usando Dio. Único lugar que importa Dio
/// e [DioException]; o resto do app usa apenas [HttpClient] e [ApiException].
class DioHttpClient implements HttpClient {
  DioHttpClient(this._dio);

  final Dio _dio;

  @override
  Future<Map<String, dynamic>?> post(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        path,
        data: data,
        options: Options(contentType: Headers.jsonContentType),
      );
      return response.data;
    } on DioException catch (e) {
      final message =
          messageFromResponse(e.response?.data) ?? e.message ?? 'Erro de rede';
      throw ApiException(message, e.response?.statusCode);
    }
  }
}
