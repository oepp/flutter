import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageUtility {
  static Image fromJson(Map<String, dynamic> data) {
    var bytes = List<int>();

    for (var json in data["data"]) {
      bytes.add(json);
    }

    return Image.memory(Uint8List.fromList(bytes));
  }
}
