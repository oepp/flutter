import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:oepp/pages/splash_page.dart';
import 'package:oepp/services/game_service.dart';
import 'package:oepp/services/user_service.dart';

GetIt getIt = GetIt.instance;

void main(){
  getIt.registerSingleton<UserService>(UserService());
  getIt.registerSingleton<GameService>(GameService());
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashPage());
  }
}
