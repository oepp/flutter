import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:oepp/services/api_service.dart';

class UserService {
  ApiService _apiService;

  UserService() {
    _apiService = GetIt.instance<ApiService>();
  }

  Future<bool> register(String username, String email, String password,
      String confirmPassword) async {
    Map<String, dynamic> body() => {
          "name": "Null",
          "surname": "Null",
          "username": username,
          "email": email,
          "password": password,
          "confirmpassword": confirmPassword
        };

    return await _apiService.post("user/register", body());
  }

  Future<bool> login(String username, String password) async {
    Map<String, dynamic> body() => {"username": username, "password": password};

    return await _apiService.post("user/login", body());
  }

  Future<bool> forgotPassword(String email) async {
    Map<String, dynamic> body() => {"email": email};

    return await _apiService.post("user/forgot/password", body());
  }

  Future<bool> resetPassword(
      String resetCode, String password, String confirmPassword) async {
    Map<String, dynamic> body() => {
          "passwordResetCode": resetCode,
          "password": password,
          "confirmpassword": confirmPassword
        };

    return await _apiService.post("user/forgot/confirm/password", body());
  }
}
