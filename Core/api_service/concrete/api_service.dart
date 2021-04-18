import 'dart:convert';

import '../abstract/i_api_service.dart';
import 'package:http/http.dart' as http;

class ApiService implements IApiService{
  // Uri(scheme: "https",host: "example.com",path: "/path")
  final Uri _uri;
  ApiService(this._uri);

  final Map<String,String> _headers = <String, String>{'Content-Type': 'application/json; charset=UTF-8'};

  @override
  Future getData() async{
    http.Response response = await http.get(_uri,headers: _headers);
    return jsonDecode(response.body);
  }

  @override
  Future postData(Map json) async{
    http.Response response = await http.post(_uri,headers: _headers,body: jsonEncode(json));
    return jsonDecode(response.body);
  }


}
