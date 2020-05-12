import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/utilities/color_palette.dart';

class AlertUtility {
  static void _alert(BuildContext context, Color color, Text text) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(backgroundColor: color, content: text));
  }

  static void error(BuildContext context) {
    _alert(context, ColorPalette.alizarin,
        Text("Error :(", style: TextStyle(color: ColorPalette.clouds)));
  }

  static void success(BuildContext context) {
    _alert(context, ColorPalette.greenSea,
        Text("Success :)", style: TextStyle(color: ColorPalette.clouds)));
  }
}
