import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/core/color_palette.dart';

class FormButton extends StatelessWidget {
  final String _text;
  final VoidCallback _onPressed;

  const FormButton(this._text, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: RaisedButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color: ColorPalette.amethyst)),
        onPressed: _onPressed,
        color: ColorPalette.amethyst,
        textColor: ColorPalette.clouds,
        child: Text(_text),
      ),
    );
  }
}
