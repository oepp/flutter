import 'dart:math';
import 'package:flutter/material.dart';
import 'package:oepp/models/game.dart';
import 'package:oepp/models/question_item.dart';
import 'package:oepp/utilities/color_palette.dart';

class GamePage extends StatefulWidget {
  final Game _game;

  GamePage(this._game);

  @override
  _GamePageState createState() => _GamePageState(_game);
}

class _GamePageState extends State<GamePage> {
  final Game _game;

  _GamePageState(this._game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_game.getStatus()),
          backgroundColor: ColorPalette.clouds),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 30),
            child: Text("${_game.getCurrentQuestionNumber()}. ${_game.getCurrentQuestion().description}",
                style: TextStyle(
                    fontSize: 24,
                    color: ColorPalette.midnightBlue),
                textAlign: TextAlign.start),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
                children: _game.getCurrentQuestion().lines.map((line) {
                  return Row(
                      children: line.items.map((item) {
                        if (item.isBlank){
                          return QuestionItemSlot(item);
                        }

                        return QuestionTextItem(item.text);
                      }).toList());
                }).toList()
            )
          ),
          Expanded(child: Container()),
          Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: _game.getCurrentQuestion().getBlankItems().map((item) => DraggableQuestionItem(item)).toList(),
              )
          ),
        ],
      ),
    );
  }
}

class QuestionItemSlot extends StatefulWidget {
  final QuestionItem _item;

  const QuestionItemSlot(this._item);

  @override State<StatefulWidget> createState() {
    return _QuestionItemSlotState(_item);
  }
}

class _QuestionItemSlotState extends State<QuestionItemSlot> {
  final QuestionItem _item;

  _QuestionItemSlotState(this._item);

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
          return Container(height: 24, width: 50, color: ColorPalette.midnightBlue);
      },
      onWillAccept: (data) => true,
      onAccept: (data) {
        setState(() {
          _item.isBlank = false;
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
    return Text(_text, style: TextStyle(fontSize: 24));
  }
}

class DraggableQuestionItem extends StatelessWidget {
  final QuestionItem _item;

  DraggableQuestionItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Draggable<QuestionItem>(
        data: _item,
        child: Container(margin: EdgeInsets.all(10), child: _item.isBlank == true ? Text(_item.text, style: TextStyle(fontSize: 24)) : Container()),
        feedback: Container(child: Text(_item.text), color: Colors.black),
        childWhenDragging: Container(child: Text(_item.text))
    );
  }
}