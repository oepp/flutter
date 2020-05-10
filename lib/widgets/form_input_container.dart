import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/core/color_palette.dart';

class FormInputContainer extends StatelessWidget {
  final List<Widget> _inputFields;

  const FormInputContainer(this._inputFields);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorPalette.clouds,
                blurRadius: 20,
                offset: Offset(0, 10),
              )
            ]),
        child: Column(children: _inputFields));
  }
}
