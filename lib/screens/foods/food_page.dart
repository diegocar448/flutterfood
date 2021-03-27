import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/Category.dart';
import '../../models/Food.dart';
import '../../models/Restaurant.dart';
import './widgets/Categories.dart';
import '../../widgets/food-card.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../stores/foods.store.dart';
import '../../widgets/custom_circular_progress_indicator.dart';
import '../../stores/categories.store.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  Restaurant _restaurant;
  FoodsStore storeFoods = new FoodsStore();
  /* Aqui vamos criar um objeto do nosso categoryStore (Aqui ja vai carregar as categorias da company especifica) */
  CategoriesStore storeCategories = new CategoriesStore();

  @override
  /* Aqui teremos duas propriedades */
  /* Aqui criamos a lista */

  /* Aqui conseguimos retornar todos os dados do restaurantes */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    RouteSettings settings = ModalRoute.of(context).settings;
    _restaurant = settings.arguments;

    /* 
      Antes de fazer o carregamento das comidas, faremos aqui, o carregamento de nossas categorias,
      passando o token == _restaurant.uuid
    */
    storeCategories.getCategories(_restaurant.uuid);

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
      children: <Widget>[
        Observer(builder: (context) {
          return storeCategories.isLoading
              ? CustomCircularProgressIndicator(
                  textLabel: "Carregando as categorias...",
                )
              : storeFoods.foods.length == 0
                  ? Center(
                      child: Text(
                        'Nenhuma Categoria',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  /* aqui pegamos as categorias, usamos o widget Categories para ter a responsividade*/
                  : Categories(storeCategories.categories);
        }),
        Observer(
          builder: (context) {
            return storeFoods.isLoading
                ? CustomCircularProgressIndicator(
                    textLabel: "Carregando os produtos...",
                  )
                : storeFoods.foods.length == 0
                    ? Center(
                        child: Text(
                          'Nenhum Produto',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : _buildFoods();
          },
        ),
      ],
    );
  }

  Widget _buildFoods() {
    return Container(
        /* Pegamos a altura total - 230 */
        height: (MediaQuery.of(context).size.height - 190),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        /* Observer vai observar a lista e verificar se houve alteração ou não */
        child: ListView.builder(
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
            }));
  }
}
