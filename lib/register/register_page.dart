import 'package:flutter/material.dart';
import 'package:oepp/core/core.dart';
import 'package:oepp/login/login.dart';

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
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: 200.0,
                            height: 200.0,
                            color: ColorPalette.amethyst),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
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
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: ColorPalette.clouds))),
                                child: TextField(
                                  controller: _usernameController,
                                  cursorColor: ColorPalette.amethyst,
                                  style: TextStyle(
                                    color: ColorPalette.wetAsphalt,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                          color: ColorPalette.silver)),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: ColorPalette.clouds))),
                                  child: TextField(
                                    controller: _emailController,
                                    cursorColor: ColorPalette.amethyst,
                                    style: TextStyle(
                                      color: ColorPalette.wetAsphalt,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: ColorPalette.silver),
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: ColorPalette.clouds))),
                                  child: TextField(
                                    controller: _passwordController,
                                    cursorColor: ColorPalette.amethyst,
                                    style: TextStyle(
                                      color: ColorPalette.wetAsphalt,
                                    ),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: ColorPalette.silver),
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: TextField(
                                    controller: _confirmPasswordController,
                                    cursorColor: ColorPalette.amethyst,
                                    style: TextStyle(
                                      color: ColorPalette.wetAsphalt,
                                    ),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Confirm Password",
                                      hintStyle:
                                          TextStyle(color: ColorPalette.silver),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                side: BorderSide(color: ColorPalette.amethyst)),
                            onPressed: () {
                              Navigator.push(
                                  context, PageTransition(widget: LoginPage()));
                            },
                            color: ColorPalette.amethyst,
                            textColor: ColorPalette.clouds,
                            child: Text("Create Account"),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    )))));
  }
}
