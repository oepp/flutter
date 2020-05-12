import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  static const url =
      "http://192.168.1.101:3001/user/register";
  static const headers = {
    'Content-Type': 'application/json'
  };

  Future<bool> register(String username, String email, String password) async {
    Map<String, dynamic> body() => {
      "name": "Null",
      "surname": "Null",
      "username": username,
      "email": email,
      "password": password
    };

    var response = await http.post(url, headers: headers, body: json.encode(body()));

    return (jsonDecode(response.body)["status"] == "success");
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}