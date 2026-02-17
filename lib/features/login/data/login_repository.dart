import 'package:recarga/core/network/http_client.dart';
import 'package:recarga/features/login/data/login_request.dart';
import 'package:recarga/features/login/data/login_response.dart';

class LoginFailure implements Exception {
  LoginFailure(this.message);
  final String message;
  @override
  String toString() => message;
}

class LoginRepository {
  LoginRepository(this._client);

  final HttpClient _client;

  static const String _path = '/api/auth/login';

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final data = await _client.post(_path, data: request.toJson());
      if (data == null) throw LoginFailure('');
      return LoginResponse.fromJson(data);
    } on ApiException catch (e) {
      throw LoginFailure(e.message);
    }
  }
}
