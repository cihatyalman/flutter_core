import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../abstract/i_api_service.dart';

class HttpService implements IApiService {
  final String _baseUrl;

  HttpService(this._baseUrl);

  final Map<String, String> _headers = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };

  @override
  Future get({
    required String path,
    Map<String, String>? headers,
  }) async {
    if (headers != null) _headers.addEntries(headers.entries);
    try {
      var response = await http.get(
        Uri.parse(_baseUrl + path),
        headers: _headers,
      );
      return jsonDecode(response.body);
    } catch (e) {
      print("[C_ERROR]: $e");
      return null;
    }
  }

  @override
  Future post({
    required String path,
    required Map<String,dynamic> json,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(_baseUrl + path),
        headers: headers ?? _headers,
        body: jsonEncode(json),
      );
      return jsonDecode(response.body);
    } catch (e) {
      print("[C_ERROR]: $e");
      return null;
    }
  }

  @override
  Future? postFormData({
    required String path,
    required Map<String, dynamic> json,
    Map<String, String>? headers,
  }) async {}
}
