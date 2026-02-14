import 'package:dio/dio.dart';

import 'package:recarga/features/login/data/login_request.dart';
import 'package:recarga/features/login/data/login_response.dart';

class LoginFailure implements Exception {
  LoginFailure(this.message);
  final String message;
  @override
  String toString() => message;
}

class LoginRepository {
  LoginRepository(this._dio);

  final Dio _dio;

  static const String _path = '/api/auth/login';

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        _path,
        data: request.toJson(),
        options: Options(contentType: Headers.jsonContentType),
      );
      final data = response.data;
      if (data == null) throw LoginFailure('');
      return LoginResponse.fromJson(data);
    } on DioException catch (e) {
      final msg = e.response?.data is Map<String, dynamic>
          ? (e.response!.data! as Map<String, dynamic>)['message'] as String? ??
              (e.response!.data! as Map<String, dynamic>)['error'] as String?
          : null;
      throw LoginFailure(msg ?? '');
    }
  }
}
