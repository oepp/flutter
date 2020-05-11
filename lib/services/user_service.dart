import 'dart:async';
import 'package:http/http.dart' as http;

class UserService {
  Future<http.Response> register(String username, String email, String password) async {
    Map<String, dynamic> post = new Map<String, dynamic>();
    post["username"] = username;
    post["email"] = username;
    post["password"] = password;
    const String url = "http://localhost:3001/user/register";
    var response = await http.post(url, body: post);
    print('Response status: ${response.statusCode}');

    return response;
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