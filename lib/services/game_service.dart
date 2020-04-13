import 'dart:async';
import 'package:oepp/models/game_info.dart';
import 'package:oepp/models/game_type.dart';

class GameService {
  Future<List<GameInfo>> getPopularGames() async {
    await Future.delayed(Duration(seconds: 1));
    var list = new List<GameInfo>();
    list.add(new GameInfo(1, GameType.flashCard, "Dart 101"));
    list.add(new GameInfo(1, GameType.fillInBlanks, "C# 101"));
    list.add(new GameInfo(2, GameType.flashCard, "Java 101"));
    list.add(new GameInfo(3, GameType.flashCard, "Python 101"));
    list.add(new GameInfo(2, GameType.fillInBlanks, "C++ 101"));
    list.add(new GameInfo(4, GameType.flashCard, "Unity 101"));
    list.add(new GameInfo(3, GameType.fillInBlanks, "Dart 101"));
    return list;
  }
}
