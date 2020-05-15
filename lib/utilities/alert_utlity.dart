import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/utilities/color_palette.dart';

class AlertUtility {
  static void alert(BuildContext context, Color color, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        content: Text(text, style: TextStyle(color: ColorPalette.clouds))));
  }

  static void error(BuildContext context) {
    alert(context, ColorPalette.alizarin, "Error :(");
  }

  static void success(BuildContext context) {
    alert(context, ColorPalette.greenSea, "Success :)");
  }

  static void alertWithScaffoldKey(
      GlobalKey<ScaffoldState> scaffoldKey, Color color, String text) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        content: Text(text, style: TextStyle(color: ColorPalette.clouds))));
  }
}
