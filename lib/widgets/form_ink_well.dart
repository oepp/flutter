import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/utilities/color_palette.dart';

class FormInkWell extends StatelessWidget {
  final String _text;
  final VoidCallback _onTap;

  const FormInkWell(this._text, this._onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      highlightColor: ColorPalette.transparent,
      splashColor: ColorPalette.greenSea,
      child: Text(_text,
          style: TextStyle(
            color: ColorPalette.greenSea,
          )),
    );
  }
}
