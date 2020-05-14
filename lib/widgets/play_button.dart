import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/utilities/color_palette.dart';

class PlayButton extends StatelessWidget {
  final VoidCallback _onPressed;

  const PlayButton(this._onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        height: 100,
        width: 100,
        child: Ink(
            decoration: ShapeDecoration(
                color: ColorPalette.greenSea,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            child: IconButton(
                icon: Icon(Icons.play_arrow, color: ColorPalette.clouds, size: 72),
                onPressed: _onPressed)));
  }
}
