import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/models/game_info.dart';
import 'package:oepp/pages/game_info_page.dart';
import 'package:oepp/utilities/color_palette.dart';

class GameInfoCard extends StatelessWidget {
  final GameInfo _gameInfo;

  const GameInfoCard(this._gameInfo);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GameInfoPage(_gameInfo)));
      },
      child: Card(
      color: ColorPalette.greenSea,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(_gameInfo.title, style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorPalette.clouds
            ), textAlign: TextAlign.center),
          ),
          Container(
              child: Image.memory(
                  _gameInfo.imageData,
                  fit: BoxFit.scaleDown,
                  height: 50,
                  width: 100)
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("Fill in the Blanks", style: TextStyle(
                fontSize: 14,
                color: ColorPalette.clouds
            ),),
          )
        ],
      ),
    ));
  }
}
