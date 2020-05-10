import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'game_type.dart';

class GameInfo {
  int id;
  GameType type;
  String title;
  String description;
  Image image;
  String creator;
  String creationTime;

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
