// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

import '/utils/log_data.dart';
import 'api_constants.dart';

class RestClient {
  static const ENABLE_LOG = true;
  static const ACCESS_TOKEN_HEADER = 'Authorization';
  static const LANGUAGE = 'Accept-Language';

  // singleton
  static final RestClient instance = RestClient._internal();

  factory RestClient() {
    return instance;
  }

  RestClient._internal();

  late String baseUrl;
  late Map<String, dynamic> headers;

  void init(String baseUrl, {String? accessToken}) {
    this.baseUrl = baseUrl;
    headers = {'Content-Type': 'application/json'};
    if (accessToken != null) setToken(accessToken);
  }

  void setToken(String token) {
    headers[ACCESS_TOKEN_HEADER] = "Bearer $token";
  }

  void clearToken() {
    headers.remove(ACCESS_TOKEN_HEADER);
  }

  static Dio getDio({String? customUrl, bool isUpload = false}) {
    var dio = Dio(instance.getDioBaseOption(customUrl: customUrl, isUpload: isUpload));

    if (ENABLE_LOG) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, logPrint: logPrint));
    }
    // //check expire time
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError error, handler) async {
        handler.next(error);
      },
    ));

    return dio;
  }

  BaseOptions getDioBaseOption({String? customUrl, bool isUpload = false}) {
    return BaseOptions(
      baseUrl: isUpload ? UPLOAD_PHOTO_URL : customUrl ?? instance.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: instance.headers,
      responseType: ResponseType.json,
    );
  }
}
