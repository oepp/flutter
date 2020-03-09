import 'package:flutter/material.dart';
import 'package:oepp/core/core.dart';
import 'package:oepp/login/login.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "OEPP is Loading...",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 36),
        ),
        LoadingIndicator()
      ],
    ));
  }
}
