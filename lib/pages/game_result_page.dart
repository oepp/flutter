import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:oepp/models/game_info.dart';
import 'package:oepp/pages/game_page.dart';
import 'package:oepp/pages/home_page.dart';
import 'package:oepp/services/game_service.dart';
import 'package:oepp/utilities/color_palette.dart';
import 'package:oepp/utilities/page_transition.dart';
import 'package:oepp/widgets/game_button.dart';

class GameResultPage extends StatelessWidget {
  final GameInfo _gameInfo;
  final int _correctAnswers;
  final int _totalQuestions;

  GameResultPage(this._gameInfo, this._correctAnswers, this._totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Game Result"),
          backgroundColor: ColorPalette.greenSea),
      backgroundColor: ColorPalette.clouds,
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(_gameInfo.title,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.midnightBlue),
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text("Correct Answers: $_correctAnswers",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.greenSea),
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text("Wrong Answers: ${_totalQuestions - _correctAnswers}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.alizarin),
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text("Result: ${_totalQuestions - _correctAnswers > 3 ? "Pass" : "Fail"}",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _totalQuestions - _correctAnswers > 3 ? ColorPalette.greenSea : ColorPalette.alizarin),
                      textAlign: TextAlign.center),
                )
              ],
            ),
          )),
          GameButton("Continue", ColorPalette.greenSea, () {
            GetIt.instance<GameService>().getGame(_gameInfo.id).then((game) {
              Navigator.push(context, PageTransition(widget: HomePage()));
            });
          })
        ],
      ),
    );
  }
}
