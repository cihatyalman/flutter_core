// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';

import 'i_api_service.dart';

class DioService implements IApiService {
  final String baseUrl;
  final Map<String, dynamic>? headers;

  final dio = Dio();

  DioService(
    this.baseUrl, {
    this.headers,
  }) {
    dio
      ..options.baseUrl = baseUrl
      ..interceptors.add(_CustomInterceptors());
  }

  @override
  Future get({
    required String path,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await dio.get(
        path,
        queryParameters: params,
        options: Options(headers: headers ?? this.headers),
      );
      return jsonDecode(response.toString());
    } catch (e) {
      print("[C_ERROR]: $e");
      return null;
    }
  }

  @override
  Future post({
    required String path,
    required Map<String, dynamic> json,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await dio.post(
        path,
        data: jsonEncode(json),
        queryParameters: params,
        options: Options(headers: headers ?? this.headers),
      );
      return jsonDecode(response.toString());
    } catch (e) {
      print("[C_ERROR]: $e");
      return null;
    }
  }

  @override
  Future? postFormData({
    required String path,
    required Map<String, dynamic> json,
    Map<String, dynamic>? params,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await dio.post(
        path,
        data: FormData.fromMap(json),
        queryParameters: params,
        options: Options(headers: headers ?? this.headers),
      );
      return jsonDecode(response.toString());
    } catch (e) {
      print("[C_ERROR]: $e");
      return null;
    }
  }
}

class _CustomInterceptors extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // print(
    //   'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    // );
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // Todo: Custom Edit
    if (err.response?.statusCode == 500) {}
    print(
        "StatusCode: ${err.response?.statusCode} => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}
