import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const _url = "http://192.168.1.101:3001/";
  static const _headers = {'Content-Type': 'application/json'};

  Future<bool> post(String path, Map<String, dynamic> body) async {
    var response = await http.post(_url + path,
        headers: _headers, body: json.encode(body));

    return (jsonDecode(response.body)["status"] == "success");
  }

  Future<http.Response> get(String path) async {
    var response = await http.get(_url + path, headers: _headers);

    return response;
  }
}
