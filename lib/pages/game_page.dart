import 'dart:math';
import 'package:flutter/material.dart';
import 'package:oepp/models/game.dart';
import 'package:oepp/models/question_item.dart';
import 'package:oepp/utilities/alert_utlity.dart';
import 'package:oepp/utilities/color_palette.dart';
import 'package:oepp/widgets/game_button.dart';

class GamePage extends StatefulWidget {
  final Game _game;

  GamePage(this._game);

  @override
  _GamePageState createState() => _GamePageState(_game);
}

class _GamePageState extends State<GamePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Game _game;
  int _seed = 0;
  int _correctAnswers = 0;
  Map<String, String> _blankMap;
  List<String> _draggedItems;

  _GamePageState(this._game) {
    _blankMap = Map<String, String>();
    _init();
  }

  void _init() {
    _seed++;

    _draggedItems = _game.getCurrentQuestion().getBlankTexts()
      ..shuffle(Random(_seed));

    for (var item in _draggedItems) {
      _blankMap[item] = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          title: Text(_game.getStatus(), style: TextStyle(color: ColorPalette.clouds)),
          backgroundColor: ColorPalette.greenSea),
      backgroundColor: ColorPalette.clouds,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 30),
            child: Text(
                "${_game.getCurrentQuestionNumber()}. ${_game.getCurrentQuestion().description}",
                style:
                    TextStyle(fontSize: 20, color: ColorPalette.midnightBlue),
                textAlign: TextAlign.left),
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  children: _game.getCurrentQuestion().lines.map((line) {
                return Row(
                    children: line.items.map((item) {
                  if (item.isBlank) {
                    return _createItemSlot(item.text);
                  }

                  return QuestionTextItem(item.text);
                }).toList());
              }).toList())),
          Expanded(child: Container()),
          Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _draggedItems
                    .map((item) => Draggable<String>(
                        data: item,
                        child: Container(
                            child: _draggedItems.contains(item)
                                ? Container(
                                    color: ColorPalette.greenSea,
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(item,
                                            style: TextStyle(
                                                fontSize: 28,
                                                color: ColorPalette.clouds))))
                                : Container()),
                        feedback: Container(
                            child: _draggedItems.contains(item)
                                ? Container(
                                    color: ColorPalette.greenSea,
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(item,
                                            style: TextStyle(fontSize: 28, color: ColorPalette.clouds))))
                                : Container()),
                        childWhenDragging: Container()))
                    .toList(),
              )),
          (_draggedItems.length > 0)
              ? GameButton("Check", ColorPalette.silver, null)
              : GameButton("Check", ColorPalette.greenSea, () {
                  setState(() {
                    bool isCorrect = true;

                    for (var blank in _blankMap.entries){
                      if (blank.key != blank.value){
                        isCorrect = false;
                      }
                    }

                    if (isCorrect){
                      _correctAnswers++;
                      AlertUtility.alertWithScaffoldKey(_scaffoldKey, ColorPalette.greenSea, "Correct answer :)");
                    }else
                      {
                        AlertUtility.alertWithScaffoldKey(_scaffoldKey, ColorPalette.alizarin, "Wrong answer :(");
                      }

                    if (_game.isOver()) {
                      //Navigate to results
                    } else {
                      _game.nextQuestion();
                      _init();
                    }
                  });
                })
        ],
      ),
    );
  }

  Widget _createItemSlot(String item) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (_blankMap[item] == null) {
          return Container(
              child: Text("____ ",
                  style:
                      TextStyle(fontSize: 28, color: ColorPalette.greenSea)));
        }

        return Text(_blankMap[item],
            style: TextStyle(fontSize: 28, color: ColorPalette.greenSea));
      },
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        setState(() {
          _draggedItems.remove(data);
          _blankMap[item] = data;
        });
      },
      onLeave: (data) {},
    );
  }
}

class QuestionTextItem extends StatelessWidget {
  final String _text;

  QuestionTextItem(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(_text, style: TextStyle(fontSize: 28));
  }
}
