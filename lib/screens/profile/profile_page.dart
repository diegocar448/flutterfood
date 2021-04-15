import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../stores/auth.store.dart';
import 'package:flutterfood/widgets/flutter_bottom_navigator.dart';

class ProfileScreen extends StatelessWidget {
  AuthStore _authStore;

  @override
  Widget build(BuildContext context) {
    _authStore = Provider.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Meu Perfil'),
        centerTitle: true,
      ),
      body: Center(child: _buildProfileScreen(context)),
      bottomNavigationBar: FlutterFoodBottomNavigator(3),
    );
  }

  Widget _buildProfileScreen(context) {
    return Container(
        child: Column(
      /* Centralizando verticalmente */
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_authStore.user.name,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        Container(height: 10),
        Text(_authStore.user.email, style: TextStyle(color: Colors.black)),
        Container(height: 10),
        Container(
          child: RaisedButton(
              /* Aqui nós chamaos o metodo logout com a regra logo abaixo */
              onPressed: () => _authStore.isLoading ? null : logout(context),
              child: Text(_authStore.isLoading ? 'Saindo...' : "Sair"),
              elevation: 2.2,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(
                    color: Colors.redAccent,
                  ))),
        ),
      ],
    ));
  }

  /* Metodo q faz apenas a logica do onPressed de _buildProfileScreen*/
  Future logout(context) async {
    await _authStore.logout();

    Navigator.pushReplacementNamed(context, "/login");
  }
}
