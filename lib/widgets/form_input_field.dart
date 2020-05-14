import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/utilities/color_palette.dart';

class FormInputField extends StatelessWidget {
  final TextEditingController _controller;
  final String _hintText;
  final bool _obscureText;

  const FormInputField(this._controller, this._hintText, this._obscureText);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ColorPalette.clouds))),
        child: TextField(
          controller: _controller,
          cursorColor: ColorPalette.greenSea,
          style: TextStyle(
            color: ColorPalette.wetAsphalt,
          ),
          obscureText: _obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: _hintText,
            hintStyle: TextStyle(color: ColorPalette.silver),
          ),
        ));
  }
}
