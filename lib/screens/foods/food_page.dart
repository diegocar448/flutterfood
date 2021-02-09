import 'package:flutter/material.dart';

import 'package:flutterfood/models/Category.dart';
import 'package:flutterfood/models/Food.dart';
import 'package:flutterfood/screens/foods/widgets/Categories.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  @override

  /* Aqui teremos duas propriedades */
  /* Aqui criamos a lista */
  List<Category> _categories = [
    new Category(name: 'Salgados', description: "asd", identify: 'asdas'),
    new Category(name: 'Doces', description: "asd", identify: 'asdas'),
    new Category(name: 'Bolos', description: "asd", identify: 'asdas'),
    new Category(name: 'Bolachas', description: "asd", identify: 'asdas'),
  ];
  List<Food> _foods = [];
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EspecializaTi Res"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildFoods(),
    );
  }

  /* Aqui teremos a listagem das comidas e depois a listagem das categorias */
  Widget _buildFoods() {
    return Column(
      children: <Widget>[Categories(_categories)],
    );
  }
}
