import 'package:recarga/core/network/http_client.dart';
import 'package:recarga/features/sign_up/data/register_request.dart';
import 'package:recarga/features/sign_up/data/user_response.dart';

class RegisterFailure implements Exception {
  RegisterFailure(this.message);
  final String message;
  @override
  String toString() => message;
}

class RegisterRepository {
  RegisterRepository(this._client);

  final HttpClient _client;

  static const String _path = '/api/auth/register';

  Future<UserResponse> register(RegisterRequest request) async {
    try {
      final data = await _client.post(_path, data: request.toJson());
      if (data == null) throw RegisterFailure('');
      return UserResponse.fromJson(data);
    } on ApiException catch (e) {
      throw RegisterFailure(e.message);
    }
  }
}
