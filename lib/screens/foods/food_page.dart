import 'package:flutter/material.dart';

import 'package:flutterfood/models/Category.dart';
import 'package:flutterfood/models/Food.dart';
import 'package:flutterfood/screens/foods/widgets/Categories.dart';
import 'package:flutterfood/widgets/food-card.dart';

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

  List<Food> _foods = [
    new Food(
        identify: 'qwert',
        image:
            'https://i.pinimg.com/originals/90/4a/8a/904a8a938527c0570833047102744f99.jpg',
        description: "Apenas um teste",
        price: '12.2',
        title: "Sanduiche"),
    new Food(
        identify: 'qwert',
        image:
            'https://i.pinimg.com/originals/90/4a/8a/904a8a938527c0570833047102744f99.jpg',
        description: "Apenas um teste",
        price: '14.4',
        title: "Açai"),
    new Food(
        identify: 'qwert',
        image:
            'https://i.pinimg.com/originals/90/4a/8a/904a8a938527c0570833047102744f99.jpg',
        description: "Apenas um teste",
        price: '18.8',
        title: "Comida Japonesa"),
    new Food(
        identify: 'qwert',
        image:
            'https://i.pinimg.com/originals/90/4a/8a/904a8a938527c0570833047102744f99.jpg',
        description: "Apenas um teste",
        price: '20.2',
        title: "Quarto Teste"),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EspecializaTi Res"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: buildScreen(),
    );
  }

  /* Aqui teremos a listagem das comidas e depois a listagem das categorias */
  Widget buildScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Categories(_categories), _buildFoods()],
    );
  }

  Widget _buildFoods() {
    return Container(
      /* Pegamos a altura total - 230 */
      height: (MediaQuery.of(context).size.height - 230),
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: ListView.builder(
          itemCount: _foods.length,
          itemBuilder: (context, index) {
            final Food food = _foods[index];

            return FoodCard(
              identify: food.identify,
              description: food.description,
              image: food.image,
              price: food.price,
              title: food.title,
            );
          }),
    );
  }
}
