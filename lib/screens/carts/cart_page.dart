import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../widgets/show_image_cached_network.dart';

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
      body: _bodyContentCart(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(2),
    );
  }

  Widget _bodyContentCart(context) {
    return Column(
      children: <Widget>[
        _buildHeader(),
        _buildCartList(context),
        // _buildCartList(),
        //_buildFormComment(),
        //_buttonCheckout(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(16),
      child: Text("Total (3) Items", style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildCartList(context) {
    return Container(
      //color: Colors.amber,
      height: (MediaQuery.of(context).size.height - 175),
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => _buildCartItems(context),
      ),
    );
  }

  /* Aqui construimos os items da lista */
  Widget _buildCartItems(context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Container(
        padding: EdgeInsets.all(2),
        child: Row(
          children: <Widget>[
            ShowImageCachedNetwork(
                'https://florinafood.gr/imgs/logos/fresh.png')
          ],
        ),
      ),
    );
  }
}
