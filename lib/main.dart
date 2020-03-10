import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oepp/services/user_service.dart';
import 'package:oepp/splash/splash.dart';
import 'authentication/authentication';

void main() {
  final userService = UserService();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userService)
          ..add(OnInitialize());
      },
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage()
    );
  }
}