import 'package:dio/dio.dart' as dio;

import '/data/api/exceptions/api_exception.dart';
import '/data/api/models/response/api_respone.dart';
import '/data/api/models/response/data_response.dart';
import '/data/api/rest_client.dart';

enum JsonType { FULL_RESPONSE, JSON_RESPONSE, BODY_BYTES, STRING_RESPONSE }

abstract class BaseService {
  Future<dynamic> getWithCustomUrl(String customUrl, String path, {Map<String, dynamic>? params, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio(customUrl: customUrl).get(path, queryParameters: params);
    return response.data;
  }

  Future<dynamic> get(String path, {Map<String, dynamic>? params, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio().get(path, queryParameters: params);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> post(String path, {data, bool enableCache = false, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio().post(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> put(String path, {data, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio().put(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> delete(String path, {data, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio().delete(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> postUpload(String path, {data, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio(isUpload: true).post(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  dynamic _handleResponse(dio.Response response, {JsonType responseType = JsonType.JSON_RESPONSE}) {
    switch (response.statusCode) {
      case 200:
        if (responseType == JsonType.JSON_RESPONSE) {
          return ApiResponse.fromJson(response.data).data;
        } else if (responseType == JsonType.FULL_RESPONSE) {
          return response.data;
        } else if (responseType == JsonType.STRING_RESPONSE) {
          var apiResponse = ApiResponse.fromJson(response.data);
          return DataResponse(apiResponse.data, description: apiResponse.description ?? "200");
        } else if (responseType == JsonType.BODY_BYTES) {
          var apiResponse = ApiResponse.fromJson(response.data);
          return DataResponse(apiResponse.data, description: apiResponse.description ?? "200");
        } else {
          var apiResponse = ApiResponse.fromJson(response.data);
          throw ApiException(
            error: apiResponse.description,
            message: apiResponse.message,
          );
        }
      default:
        var apiResponse = ApiResponse.fromJson(response.data);
        throw ApiException(
          error: apiResponse.description,
          message: apiResponse.message,
        );
    }
  }
}
