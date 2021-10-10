import 'dart:convert';
import 'dart:io';

import '../abstract/i_api_service.dart';
import 'package:http/http.dart' as http;

class ApiService implements IApiService {
  final String _baseUrl;

  ApiService(this._baseUrl);

  final Map<String, String> _headers = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };

  @override
  Future getData({
    required String path,
    Map<String, String>? headers,
  }) async {
    var response = await http.get(
      Uri.parse(_baseUrl + path),
      headers: headers ?? _headers,
    );
    return jsonDecode(response.body);
  }

  @override
  Future postData({
    required String path,
    required Map json,
    Map<String, String>? headers,
  }) async {
    var response = await http.post(
      Uri.parse(_baseUrl + path),
      headers: headers ?? _headers,
      body: jsonEncode(json),
    );
    return jsonDecode(response.body);
  }
}
