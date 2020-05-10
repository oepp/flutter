import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oepp/authentication/authentication';
import 'package:oepp/core/core.dart';
import 'package:oepp/home/home_page.dart';
import 'package:oepp/pages/login_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Authenticated) {
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
              ));
        },
      ),
    );
  }
}
