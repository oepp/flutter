import 'dart:async';
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:oepp/models/game_info.dart';
import 'package:oepp/models/question.dart';
import 'api_service.dart';

class GameService {
  ApiService _apiService;

  GameService() {
    _apiService = GetIt.instance<ApiService>();
  }

  Future<List<GameInfo>> getPopularGameInfos() async {
    var data = await _apiService.get("games/infos/popular");
    var infos = List<GameInfo>();

    for (var json in data["data"]){
      infos.add(GameInfo.fromJson(json));
    }

    return infos;
  }

  Future<List<Question>> getGameQuestions(int id) async {
    var data = await _apiService.get("games/files/$id");
    var questions = List<Question>();

    for (var json in data["data"]){
      questions.add(Question.fromJson(json));
    }

    return questions;
  }
}
