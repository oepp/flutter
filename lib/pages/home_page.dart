import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/utilities/alert_utlity.dart';
import 'package:oepp/utilities/color_palette.dart';
import 'package:oepp/models/game_info.dart';
import 'package:oepp/services/game_service.dart';
import 'package:oepp/widgets/game_info_card.dart';
import 'package:oepp/widgets/loading_indicator.dart';

class HomePage extends StatelessWidget {
  final GameService _gameService = new GameService();

  Widget build(BuildContext context) {
    return FutureBuilder<List<GameInfo>>(
      future: _gameService.getPopularGameInfos(),
      builder: (BuildContext context, AsyncSnapshot<List<GameInfo>> snapshot) {
        List<Widget> children;

        if (snapshot.hasData) {
          children = <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 25, right: 5, left: 5),
                width: double.infinity,
                height: 75.0,
                color: ColorPalette.greenSea,
                child: Center(
                    child: Text(
                  "Popular Games",
                  style: TextStyle(fontSize: 36, color: ColorPalette.clouds),
                ))),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children:
                  snapshot.data.map((item) => GameInfoCard(item)).toList(),
            ))
          ];
        } else if (snapshot.hasError) {
          AlertUtility.error(context);
        } else {
          children = <Widget>[LoadingIndicator()];
        }
        return Scaffold(
          backgroundColor: ColorPalette.clouds,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: children,
              ),
            ),
          ),
        );
      },
    );
  }
}
