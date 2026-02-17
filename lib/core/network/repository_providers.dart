import 'package:dio/dio.dart';

import 'package:recarga/core/config/api_config.dart';
import 'package:recarga/core/network/dio_http_client.dart';
import 'package:recarga/core/network/http_client.dart';
import 'package:recarga/features/login/data/login_repository.dart';
import 'package:recarga/features/sign_up/data/register_repository.dart';

Dio _createDio() {
  return Dio(BaseOptions(baseUrl: ApiConfig.baseUrl));
}

Dio? _dio;
HttpClient get _httpClient =>
    DioHttpClient(_dio ??= _createDio());

LoginRepository getLoginRepository() => LoginRepository(_httpClient);

RegisterRepository getRegisterRepository() => RegisterRepository(_httpClient);
