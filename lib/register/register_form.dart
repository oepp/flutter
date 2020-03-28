import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oepp/authentication/authentication_bloc.dart';
import 'package:oepp/authentication/authentication_event.dart';

class RegisterForm extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
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
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'e-mail'
                    ),
                    obscureText: true,
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
                ),
          RaisedButton(
            child: Text('Register'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
              ],
            ),
          )
      ),
    );
  }
}
