import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterfood/data/network/interceptors/dio_interceptor.dart';
import 'package:provider/provider.dart';

import 'package:flutterfood/screens/auth/register_page.dart';
import 'package:flutterfood/screens/auth/widgets/heading_auth.dart';
import '../../stores/auth.store.dart';

class LoginScreen extends StatelessWidget {
  double _deviceWidth;
  double _deviceHeight;

  AuthStore _authStore;
  /* propriedade para manipular as informações dos nossos widget */
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  FlutterSecureStorage storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of<AuthStore>(context);

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      /* Pegando as configurações de background main */
      backgroundColor: Theme.of(context).backgroundColor,
      /* 
        1º SingleChildScrollView cria um scroll impedindo quebra do layout 
        2º Passamos o context em _loginPageUI para que possa ser usado pelas widgets filhas
      */
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) => _loginPageUI(context),
        ),
      ),
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
          _emailTextField(context),
          _passwordTextField(context),
        ],
      ),
    );
  }

  Widget _emailTextField(context) {
    /* Usaremos o TextFormField por ele ter varios recursos relacionados a validação */
    return TextFormField(
      controller: _email,
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
          hintText: "E-mail",
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _passwordTextField(context) {
    /* Usaremos o TextFormField por ele ter varios recursos relacionados a validação */
    return TextFormField(
      controller: _password,
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
          hintText: "Password",
          hintStyle: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }

  Widget _loginButton(context) {
    return Container(
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () => _authStore.isLoading ? null : auth(context),
        /* Ao pressionar aqui faz comunicação com mobx que faz com repository que faz para api */
        /* Navigator.pushReplacementNamed(context, '/restaurants'); */

        color: Theme.of(context).primaryColor,
        child: Text(_authStore.isLoading ? 'Autenticando...' : "LOGIN"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget _textRegister(context) {
    return GestureDetector(
        /* onTap e para quando clicar nele */
        onTap: () {
          /* Varia redirecionar para a view register_page.dart */
          /* Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RegisterScreen(),
          )); */
          Navigator.pushNamed(context, '/register');
        },
        child: Text(
          'Cadastrar-se',
          style:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 18.2),
        ));
  }

  /* Aqui vamos usar uma instancia do Mobx para fazer a autenticação*/
  Future auth(context) async {
    /* Após autenticar faremos um redirect */
    await _authStore
        .auth(_email.text, _password.text)
        .then((value) => Navigator.pushReplacementNamed(context, '/'));
  }
}
