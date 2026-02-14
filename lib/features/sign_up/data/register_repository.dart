import 'package:dio/dio.dart';

import 'package:recarga/features/sign_up/data/register_request.dart';
import 'package:recarga/features/sign_up/data/user_response.dart';

class RegisterFailure implements Exception {
  RegisterFailure(this.message);
  final String message;
  @override
  String toString() => message;
}

class RegisterRepository {
  RegisterRepository(this._dio);

  final Dio _dio;

  static const String _path = '/api/auth/register';

  Future<UserResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        _path,
        data: request.toJson(),
        options: Options(contentType: Headers.jsonContentType),
      );
      final data = response.data;
      if (data == null) throw RegisterFailure('');
      return UserResponse.fromJson(data);
    } on DioException catch (e) {
      final msg = e.response?.data is Map<String, dynamic>
          ? (e.response!.data! as Map<String, dynamic>)['message'] as String? ??
              (e.response!.data! as Map<String, dynamic>)['error'] as String?
          : null;
      throw RegisterFailure(msg ?? '');
    }
  }
}
