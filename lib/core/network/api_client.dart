import 'package:dio/dio.dart';

import 'api_endpoints.dart';

class ApiClient {
  final Dio dio;

  ApiClient()
      : dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      headers: {
        "Content-Type": "application/json",
      },
    ),
  ) {

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("URL: ${options.baseUrl}${options.path}");
          print("DATA: ${options.data}");
          return handler.next(options);
        },

        onResponse: (response, handler) {
          print("URL: ${response.requestOptions.uri}");
          print("STATUS: ${response.statusCode}");
          print("DATA: ${response.data}");
          return handler.next(response);
        },

        onError: (DioException e, handler) {
          print("URL: ${e.requestOptions.uri}");
          print("MESSAGE: ${e.message}");
          print("DATA: ${e.response?.data}");
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await dio.post(path, data: data);
  }

  Future<Response> get(String path) async {
    return await dio.get(path);
  }
}