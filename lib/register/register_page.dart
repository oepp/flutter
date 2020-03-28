import 'package:flutter/material.dart';
import 'register_form.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
        body: RegisterForm()
    );
  }
}