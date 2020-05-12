import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:oepp/pages/login_page.dart';
import 'package:oepp/services/user_service.dart';
import 'package:oepp/utilities/alert_utlity.dart';
import 'package:oepp/utilities/color_palette.dart';
import 'package:oepp/utilities/page_transition.dart';
import 'package:oepp/widgets/form_button.dart';
import 'package:oepp/widgets/form_input_container.dart';
import 'package:oepp/widgets/form_input_field.dart';
import 'package:oepp/widgets/form_space.dart';
import 'package:oepp/widgets/oepp_logo.dart';

class RegisterPage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Register"), backgroundColor: ColorPalette.amethyst),
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
                        Builder(
                            builder: (context) =>
                                FormButton("Create Account", () {
                                  GetIt.instance<UserService>()
                                      .register(
                                          _usernameController.text,
                                          _emailController.text,
                                          _passwordController.text,
                                          _confirmPasswordController.text)
                                      .then((success) {
                                    if (success) {
                                      AlertUtility.success(context);
                                      Navigator.push(context,
                                          PageTransition(widget: LoginPage()));
                                    } else {
                                      AlertUtility.error(context);
                                    }
                                  });
                                  //
                                })),
                        FormSpace()
                      ],
                    )))));
  }
}
