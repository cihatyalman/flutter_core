import 'dart:convert';
import 'package:dio/dio.dart';
import '../abstract/i_api_service.dart';

class DioService implements IApiService {
  final String baseUrl;
  final Map<String,dynamic>? headers;

  DioService(
    this.baseUrl, {
    this.headers,
  });

  final dio = Dio();

  @override
  Future getData({
    required String path,
    Map<String, String>? headers,
  }) async {
    var response = await dio.get(
      baseUrl + path,
      options: Options(
        contentType: 'application/json; charset=UTF-8',
        headers: headers ?? this.headers,
      ),
    );
    return jsonDecode(response.toString());
  }

  @override
  Future postData({
    required String path,
    required Map json,
    Map<String, String>? headers,
  }) async {
    var response = await dio.post(
      baseUrl + path,
      options: Options(
        contentType: 'application/json; charset=UTF-8',
        headers: headers ?? this.headers,
      ),
      data: jsonEncode(json),
    );
    return jsonDecode(response.toString());
  }
}
