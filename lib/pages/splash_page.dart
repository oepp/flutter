import 'package:flutter/material.dart';
import 'package:oepp/pages/login_page.dart';
import 'package:oepp/widgets/oepp_logo.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
    return MaterialApp(
      home: LoginPage()
          /*if (state is Authenticated) {
            return HomePage();
          }
          if (state is Unauthenticated) {
            return LoginPage();
          }
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
              ));*/
    );
  }
}
