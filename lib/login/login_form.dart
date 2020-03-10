import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        labelText: 'Username'
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: 'Password'
                    ),
                    obscureText: true,
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
