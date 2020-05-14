import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:oepp/pages/login_page.dart';
import 'package:oepp/pages/reset_password_page.dart';
import 'package:oepp/services/user_service.dart';
import 'package:oepp/utilities/alert_utlity.dart';
import 'package:oepp/utilities/color_palette.dart';
import 'package:oepp/utilities/page_transition.dart';
import 'package:oepp/widgets/form_button.dart';
import 'package:oepp/widgets/form_input_container.dart';
import 'package:oepp/widgets/form_input_field.dart';
import 'package:oepp/widgets/form_space.dart';
import 'package:oepp/widgets/oepp_logo.dart';

class ForgotPasswordPage extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Forgot Password?"),
            backgroundColor: ColorPalette.greenSea),
        backgroundColor: ColorPalette.clouds,
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
                          FormInputField(_emailController, "Email", false)
                        ]),
                        FormSpace(),
                        Builder(
                            builder: (context) =>
                                FormButton("Send Recovery Code", () {
                                  GetIt.instance<UserService>()
                                      .forgotPassword(_emailController.text)
                                      .then((success) {
                                    if (success) {
                                      AlertUtility.success(context);
                                      Navigator.push(context,
                                          PageTransition(widget: ResetPasswordPage()));
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
