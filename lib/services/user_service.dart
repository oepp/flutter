import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  static const url =
      "http://192.168.1.101:3001/user/";
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

    var response = await http.post(url + "register", headers: headers, body: json.encode(body()));

    return (jsonDecode(response.body)["status"] == "success");
  }

  Future<bool> login(String username, String password) async {
    Map<String, dynamic> body() => {
      "username": username,
      "password": password
    };

    var response = await http.post(url + "login", headers: headers, body: json.encode(body()));
    print(response.body);

    return (jsonDecode(response.body)["status"] == "success");
  }

  Future<bool> forgotPassword(String email) async {
    Map<String, dynamic> body() => {
      "email": email
    };

    var response = await http.post(url + "forgot/password", headers: headers, body: json.encode(body()));

    return (jsonDecode(response.body)["status"] == "success");
  }

  Future<bool> resetPassword(String resetCode, String password, String confirmPassword) async {
    Map<String, dynamic> body() => {
      "resetCode": resetCode,
      "password": password,
      "confirmpassword": confirmPassword
    };

    var response = await http.post(url + "forgot/confirm/password", headers: headers, body: json.encode(body()));

    return (jsonDecode(response.body)["status"] == "success");
  }
}