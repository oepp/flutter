import 'package:flutter/cupertino.dart';

class OeppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/images/oepp_logo.png")
        )
      )
    );
  }
}
