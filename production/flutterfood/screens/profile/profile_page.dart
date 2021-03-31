import 'package:flutter/material.dart';
import 'package:flutterfood/widgets/flutter_bottom_navigator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        Text("Diego Cardoso",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        Container(height: 10),
        Text("diegocar448@hotmail.com", style: TextStyle(color: Colors.black)),
        Container(height: 10),
        Container(
          child: RaisedButton(
              onPressed: () {
                print("Logout");
              },
              child: Text("Sair"),
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
}
