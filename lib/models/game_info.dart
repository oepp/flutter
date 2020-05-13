import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:oepp/utilities/image_utility.dart';
import 'game_type.dart';

class GameInfo {
  final int id;
  final GameType type;
  final String title;
  final String description;
  final Image image;
  final String creator;
  final String creationTime;

  GameInfo(this.id, this.type, this.title, this.description, this.image,
      this.creator, this.creationTime);

  GameInfo.fromJson(Map<String, dynamic> data)
      : id = data['idGames'],
        type = GameType.fillInBlanks,
        title = data['GameTitle'],
        description = data['GameDescription'],
        image = ImageUtility.fromJson(data['GameImage']),
        creator = data['username'],
        creationTime = data['ReleaseTime'];
}
