import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:oepp/pages/forgot_password_page.dart';
import 'package:oepp/services/user_service.dart';
import 'package:oepp/utilities/alert_utlity.dart';
import 'package:oepp/utilities/page_transition.dart';
import 'package:oepp/pages/register_page.dart';
import 'package:oepp/pages/home_page.dart';
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
                              PageTransition(widget: ForgotPasswordPage()));
                        }),
                        FormSpace(),
                        Builder(
                            builder: (context) =>
                                FormButton("Login", () {
                                  GetIt.instance<UserService>()
                                      .login(
                                      _usernameController.text,
                                      _passwordController.text)
                                      .then((success) {
                                    if (success) {
                                      AlertUtility.success(context);
                                      Navigator.push(context,
                                          PageTransition(widget: HomePage()));
                                    } else {
                                      AlertUtility.error(context);
                                    }
                                  });
                                  //
                                })),
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
