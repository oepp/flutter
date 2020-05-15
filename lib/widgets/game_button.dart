import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/utilities/color_palette.dart';

class GameButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final VoidCallback _onPressed;

  const GameButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onPressed: _onPressed,
        color: _color,
        textColor: ColorPalette.clouds,
        child: Text(
          _text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
