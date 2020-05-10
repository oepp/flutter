import 'package:flutter/material.dart';
import 'package:oepp/services/user_service.dart';
import 'package:oepp/splash/splash.dart';

void main() {
  final userService = UserService();
}

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage()
    );
  }
}