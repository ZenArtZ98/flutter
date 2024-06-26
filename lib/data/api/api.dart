import 'package:dio/dio.dart';
import 'package:my_first_app/data/api/api_settings.dart';
import 'package:my_first_app/data/api/interceptor.dart';

class Api {
  late Dio _client;

  Api() {
    _client = Dio(
      BaseOptions(
        baseUrl: ApiSettings.url,
        connectTimeout: const Duration(seconds: 30),
      ),
    );

    _client.interceptors.add(AppInterceptor.base);
  }

  Dio get api => _client;
}

