import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:oepp/models/game_info.dart';

import 'api_service.dart';

class GameService {
  ApiService _apiService;

  GameService() {
    _apiService = GetIt.instance<ApiService>();
  }

  Future<List<GameInfo>> getPopularGameInfos() async {
    await Future.delayed(Duration(seconds: 1));
    var list = new List<GameInfo>();
    return list;
  }
}
