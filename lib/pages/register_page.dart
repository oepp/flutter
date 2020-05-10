import 'package:flutter/material.dart';
import 'package:oepp/pages/login_page.dart';
import 'package:oepp/utilities/page_transition.dart';
import 'package:oepp/widgets/form_button.dart';
import 'package:oepp/widgets/form_input_container.dart';
import 'package:oepp/widgets/form_input_field.dart';
import 'package:oepp/widgets/form_space.dart';
import 'package:oepp/widgets/oepp_logo.dart';

class RegisterPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                          FormInputField(
                              _usernameController, "Username", false),
                          FormInputField(_emailController, "Email", false),
                          FormInputField(_passwordController, "Password", true),
                          FormInputField(_confirmPasswordController,
                              "Confirm Password", true)
                        ]),
                        FormSpace(),
                        FormButton("Create Account", () {
                          Navigator.push(
                              context, PageTransition(widget: LoginPage()));
                        }),
                        FormSpace()
                      ],
                    )))));
  }
}
