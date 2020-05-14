import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:oepp/models/game_info.dart';
import 'package:oepp/services/user_service.dart';
import 'package:oepp/utilities/color_palette.dart';
import 'package:oepp/widgets/form_button.dart';
import 'package:oepp/widgets/play_button.dart';

class GameInfoPage extends StatelessWidget {
  final GameInfo _gameInfo;

  GameInfoPage(this._gameInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Game Info"), backgroundColor: ColorPalette.greenSea),
      backgroundColor: ColorPalette.clouds,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            child: Image.memory(_gameInfo.imageData, fit: BoxFit.scaleDown),
          ),
          Expanded(child: Container(
            width: double.infinity,
            color: ColorPalette.greenSea,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(_gameInfo.title, style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.clouds
                  ), textAlign: TextAlign.center),
                ),
                Expanded(child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    child: Text(_gameInfo.description, style: TextStyle(
                        fontSize: 16,
                        color: ColorPalette.clouds
                    ),
                    ))),
                Container(
                    width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: Text("Created by ${_gameInfo.creator} on ${_gameInfo.creationTime.substring(0, 7)}", style: TextStyle(
                      fontSize: 12,
                      color: ColorPalette.clouds
                  ), textAlign: TextAlign.right),
                )
              ],
            ),
          )),
          PlayButton(()=>{})
        ],
      ),
    );
  }
}
