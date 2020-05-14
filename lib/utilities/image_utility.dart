import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageUtility {
  static Uint8List fromJson(Map<String, dynamic> data) {
    var bytes = List<int>();

    for (var json in data["data"]) {
      bytes.add(json);
    }

    return Uint8List.fromList(bytes);
  }
}
