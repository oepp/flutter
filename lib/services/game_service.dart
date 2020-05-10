import 'dart:async';
import 'package:oepp/models/game_info.dart';
import 'package:oepp/models/game_type.dart';

class GameService {
  Future<List<GameInfo>> getPopularGames() async {
    await Future.delayed(Duration(seconds: 1));
    var list = new List<GameInfo>();
    return list;
  }
}
