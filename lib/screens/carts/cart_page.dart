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
    return Stack(children: <Widget>[
      Container(
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
                  'https://florinafood.gr/imgs/logos/fresh.png'),
              _showDetailItemCart(context)
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 24,
          width: 24,
          margin: EdgeInsets.only(top: 2, right: 4),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: Icon(Icons.close, size: 20, color: Colors.white),
        ),
      )
    ]);
  }

  Widget _showDetailItemCart(context) {
    return Expanded(
        child: Container(
            padding: EdgeInsets.only(top: 4, right: 4, left: 4),
            child: Column(
                /* jogando para o inicio ao lado da imagem */
                crossAxisAlignment: CrossAxisAlignment.start,
                /* alinhar verticalmente ao centro */
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "PIZZA HUT",
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).primaryColor),
                  ),
                  Container(
                      //color: Colors.black,

                      child: Row(
                          /* alinhar verticalmente ao espaço entre */
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                        Text(
                          "R\$ 399,00",
                          style: TextStyle(color: Colors.green),
                        ),
                        Container(height: 6),
                        Container(
                          child: Row(children: <Widget>[
                            Icon(Icons.remove,
                                size: 24, color: Colors.grey.shade700),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 4, bottom: 4, left: 12, right: 12),
                              color: Theme.of(context).primaryColor,
                              child: Text('2',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Icon(Icons.add,
                                size: 24, color: Colors.grey.shade700)
                          ]),
                        )
                      ]))
                ])));
  }
}
