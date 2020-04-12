import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oepp/authentication/authentication_bloc.dart';
import 'package:oepp/authentication/authentication_event.dart';
import 'package:oepp/core/page_transition.dart';
import 'package:oepp/register/register.dart';

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
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(OnLogin());
                  },
                ),
                RaisedButton(
                  child: Text('Register'),
                  onPressed: () {
                    Navigator.push(
                        context, PageTransition(widget: RegisterPage()));
                  },
                )
              ],
            ),
          )),
    );
  }
}
