import 'package:dio/dio.dart';

class AppInterceptor {
  static final base = InterceptorsWrapper(
    onResponse: (options, handler) {
      print('RESPONCE[${options.statusCode}]: PATH: ${options.requestOptions.path}');

      return handler.next(options);
    },
    onRequest: (RequestOptions options, handler) {
      print('REQUEST[${options.method}]: PATH: ${options.path}');
      const token = 'lmfkdmksd';
      //options.headers['Autorization'] = token;
      return handler.next(options);
    },
    onError: (error, handler) {
      print(
          'ERROR[${error.requestOptions.method}]: PATH: ${error.requestOptions.path}, MESSAGE ${error.message}');

      return handler.next(error);
    },
  );
}
