import 'package:flutter/material.dart';

import 'package:flutterfood/widgets/flutter_bottom_navigator.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliar o pedido'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreenEvaluationOrder(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(1),
    );
  }

  Widget _buildScreenEvaluationOrder(context) {
    return Container(
      child: Column(children: <Widget>[]),
    );
  }
}
