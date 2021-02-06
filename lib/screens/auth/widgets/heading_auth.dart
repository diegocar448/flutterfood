import 'package:flutter/material.dart';

class HeadingAuth extends StatelessWidget {
  const HeadingAuth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* Widget que vai retornar o nosso heading */
    return Container(
      height: 130,
      width: 130,
      /* dentro do decoration vamos adicionar uma imagem */
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/IconeFlutterFood.png'),
              fit: BoxFit.fill)),
    );
  }
}
