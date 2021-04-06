import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterfood/stores/restaurant.store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../models/Food.dart';
import '../../models/Restaurant.dart';
import 'widgets/Categories.dart';
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

  /* 
    Vamos usar um provider para criar a nossa instancia e centralizar e unificar pegando o provider 
    do arquivo main.dart
   */
  FoodsStore storeFoods;
  /* Aqui ja vai carregar as categorias da company especifica */
  CategoriesStore storeCategories;
  RestaurantsStore restaurantsStore;
  ReactionDisposer disposer;

  /* Aqui conseguimos retornar todos os dados do restaurantes */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /* Aqui instanciamos os nossos providers */
    storeFoods = Provider.of<FoodsStore>(context);
    storeCategories = Provider.of<CategoriesStore>(context);
    restaurantsStore = Provider.of<RestaurantsStore>(context);

    RouteSettings settings = ModalRoute.of(context).settings;
    _restaurant = settings.arguments;

    /* Função e o efeito adicionado em dispose ficando reutilizavel*/
    disposer = reaction(
        /* Aqui nós vamos monitorar, qdo dispara filtersCa.. gerará uma reação*/
        (_) => storeCategories.filterChanged, (filterChanged) async {
      /* Verificar se carregou categorias e comidas */
      if (!storeCategories.isLoading && !storeFoods.isLoading) {
        /* pegamos as comidas passando os filtros */
        await storeFoods.getFoods(_restaurant.uuid,
            categoriesFilter: storeCategories.filtersCategory);
      }
    });

    restaurantsStore.setRestaurant(_restaurant);
    /* 
      Antes de fazer o carregamento das comidas, faremos aqui, o carregamento de nossas categorias,
      passando o token == _restaurant.uuid
    */
    storeCategories.getCategories(_restaurant.uuid);
    /* passando o token (uuid) */
    storeFoods.getFoods(_restaurant.uuid);
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
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

              return FoodCard(food: food);
            }));
  }
}
