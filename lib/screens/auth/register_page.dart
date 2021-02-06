import 'package:flutter/material.dart';

import 'package:flutterfood/screens/auth/login_page.dart';
import 'package:flutterfood/screens/auth/widgets/heading_auth.dart';

class RegisterScreen extends StatelessWidget {
  double _deviceWidth;
  double _deviceHeight;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      /* Pegando as configurações de background main */
      backgroundColor: Theme.of(context).backgroundColor,
      /* 
        1º SingleChildScrollView cria um scroll impedindo quebra do layout 
        2º Passamos o context em _loginPageUI para que possa ser usado pelas widgets filhas
      */
      body: SingleChildScrollView(child: _loginPageUI(context)),
    );
  }

  Widget _loginPageUI(context) {
    return Container(
      /* Criar calculo proporcional para não pegar toda tela */
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.10),
      child: Column(
        children: <Widget>[
          Container(height: 50),
          HeadingAuth(),
          Container(height: 20),
          _formLogin(context),
          Container(height: 20),
          _loginButton(context),
          Container(height: 30),
          _textRegister(context),
        ],
      ),
    );
  }

  Widget _formLogin(context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(143, 148, 251, .6),
                blurRadius: 20.0,
                offset: Offset(0, 10))
          ]),
      child: Column(
        children: <Widget>[
          _nameTextField(context),
          _emailTextField(context),
          _passwordTextField(context),
        ],
      ),
    );
  }

  Widget _emailTextField(context) {
    /* Usaremos o TextFormField por ele ter varios recursos relacionados a validação */
    return TextFormField(
      autocorrect: false,
      autofocus: false,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          /* adicionará borda apenas na parte inferior do field */
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          contentPadding: EdgeInsets.all(10),
          hintText: "E-mail",
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _nameTextField(context) {
    /* Usaremos o TextFormField por ele ter varios recursos relacionados a validação */
    return TextFormField(
      autocorrect: false,
      autofocus: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          /* adicionará borda apenas na parte inferior do field */
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          contentPadding: EdgeInsets.all(10),
          hintText: "Nome",
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _passwordTextField(context) {
    /* Usaremos o TextFormField por ele ter varios recursos relacionados a validação */
    return TextFormField(
      autocorrect: false,
      autofocus: true,
      obscureText: true,
      style: TextStyle(color: Theme.of(context).primaryColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          /* adicionará borda apenas na parte inferior do field */
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: InputBorder.none,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          contentPadding: EdgeInsets.all(10),
          hintText: "Senha",
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _loginButton(context) {
    return Container(
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () {
          print('register...');
        },
        color: Theme.of(context).primaryColor,
        child: Text("CADASTRAR"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget _textRegister(context) {
    return GestureDetector(
        /* onTap e para quando clicar nele */
        onTap: () {
          /* 
            1º Varia redirecionar para a view register_page.dart 
            2º pushReplacement ele faz um replace para o usuario não ter a opção 
              de voltar e colocar uma tela sobre outra
          */
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
        },
        child: Text(
          'Já têm Cadastro? Faça o Login!',
          style:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 18.2),
        ));
  }
}
