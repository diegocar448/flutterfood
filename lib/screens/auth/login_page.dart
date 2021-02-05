import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Pegando as configurações de background main */
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Text(
          'Login',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
