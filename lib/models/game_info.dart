import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
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
      : id = data['id'],
        type = data['gameType'],
        title = data['title'],
        description = data['description'],
        image = Image.memory(base64Decode(data['image'])),
        creator = data['creator'],
        creationTime = data['creationTime'];
}
