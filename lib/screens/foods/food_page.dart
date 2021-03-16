import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/Category.dart';
import '../../models/Food.dart';
import '../../models/Restaurant.dart';
import 'package:flutterfood/screens/foods/widgets/Categories.dart';
import 'package:flutterfood/widgets/food-card.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../stores/foods.store.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  Restaurant _restaurant;
  FoodsStore storeFoods = new FoodsStore();

  @override
  /* Aqui teremos duas propriedades */
  /* Aqui criamos a lista */
  List<Category> _categories = [
    new Category(name: 'Salgados', description: "asd", identify: 'asdas'),
    new Category(name: 'Doces', description: "asd", identify: 'asdas'),
    new Category(name: 'Bolos', description: "asd", identify: 'asdas'),
    new Category(name: 'Bolachas', description: "asd", identify: 'asdas'),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    RouteSettings settings = ModalRoute.of(context).settings;
    _restaurant = settings.arguments;

    /* passando o token (uuid) */
    storeFoods.getFoods(_restaurant.uuid);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_restaurant.name}'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: buildScreen(),
      bottomNavigationBar: FlutterFoodBottomNavigator(0),
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
      height: (MediaQuery.of(context).size.height - 190),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      /* Observer vai observar a lista e verificar se houve alteração ou não */
      child: Observer(
        builder: (context) => ListView.builder(
            itemCount: storeFoods.foods.length,
            itemBuilder: (context, index) {
              final Food food = storeFoods.foods[index];

              return FoodCard(
                identify: food.identify,
                description: food.description,
                image: food.image,
                price: food.price,
                title: food.title,
                /* Aqui deixo como false pq quero que exiba a lista do carrinho */
                notShowIconCart: false,
              );
            }),
      ),
    );
  }
}
