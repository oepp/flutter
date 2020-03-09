import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'username'),
            controller: _usernameController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'password'),
            controller: _passwordController,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
