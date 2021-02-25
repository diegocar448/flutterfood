import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  /* Aqui nó vamos construir nosso carrinho */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Carrinho"),
        centerTitle: true,
      ),
      body: _bodyContentCart(),
      bottomNavigationBar: FlutterFoodBottomNavigator(2),
    );
  }

  Widget _bodyContentCart() {
    return Column(
      children: <Widget>[
        _buildHeader(),
        // _buildCartList(),
        //_buildFormComment(),
        //_buttonCheckout(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: 12, left: 12),
      child: Text("Total (3) Items", style: TextStyle(color: Colors.black)),
    );
  }
}
