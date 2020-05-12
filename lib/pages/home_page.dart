import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/utilities/color_palette.dart';
import 'package:oepp/models/game_info.dart';
import 'package:oepp/services/game_service.dart';

class HomePage extends StatelessWidget {
  final GameService _gameService = new GameService();

  Widget build(BuildContext context) {
    return FutureBuilder<List<GameInfo>>(
      future: _gameService.getPopularGameInfos(),
      // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<List<GameInfo>> snapshot) {
        List<Widget> children;

        if (snapshot.hasData) {
          children = <Widget>[
            Container(
                width: double.infinity,
                height: 100.0,
                color: ColorPalette.amethyst,
                child: Center(
                    child: Text(
                  "Popular Games",
                  style: TextStyle(fontSize: 36, color: ColorPalette.clouds),
                ))),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: snapshot.data
                  .map((item) => Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorPalette.alizarin),
                          child: Transform.translate(
                            offset: Offset(50, -50),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 65, vertical: 63),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Icon(
                                Icons.bookmark_border,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ))
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }
        return Scaffold(
          backgroundColor: Colors.grey[600],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Icon(Icons.menu),
            title: Text("Home"),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  width: 36,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("0")),
                ),
              )
            ],
          ),
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
