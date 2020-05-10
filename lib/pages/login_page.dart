import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oepp/core/page_transition.dart';
import 'package:oepp/home/home_page.dart';
import 'package:oepp/pages/register_page.dart';
import 'package:oepp/widgets/form_button.dart';
import 'package:oepp/widgets/form_ink_well.dart';
import 'package:oepp/widgets/form_input_container.dart';
import 'package:oepp/widgets/form_input_field.dart';
import 'package:oepp/widgets/form_space.dart';
import 'package:oepp/widgets/oepp_logo.dart';

class LoginPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FormSpace(),
                        OeppLogo(),
                        FormSpace(),
                        FormInputContainer(<Widget>[
                          FormInputField(_usernameController, "Username", false),
                          FormInputField(_passwordController, "Password", true)
                        ]),
                        FormSpace(),
                        FormInkWell("Forgot Password?", () {
                          Navigator.push(context,
                              PageTransition(widget: RegisterPage()));
                        }),
                        FormSpace(),
                        FormButton("Login", () {
                          Navigator.push(context,
                              PageTransition(widget: HomePage()));
                        }),
                        FormSpace(),
                        FormInkWell("Create Account", () {
                          Navigator.push(context,
                              PageTransition(widget: RegisterPage()));
                        }),
                        FormSpace()
                      ],
                    )))));
  }
}
