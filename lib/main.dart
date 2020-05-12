import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:oepp/pages/splash_page.dart';
import 'package:oepp/services/game_service.dart';
import 'package:oepp/services/user_service.dart';

void main(){
  GetIt.instance.registerSingleton<UserService>(UserService());
  GetIt.instance.registerSingleton<GameService>(GameService());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light
  ));

  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashPage());
  }
}
