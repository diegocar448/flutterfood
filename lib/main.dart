import 'package:flutter/material.dart';
import './stores/foods.store.dart';
import 'package:provider/provider.dart';

import './routes.dart';
import './constants/app_theme.dart';
import './stores/categories.store.dart';
import './stores/restaurant.store.dart';

void main() => runApp(FlutterFoodApp());

class FlutterFoodApp extends StatelessWidget {
  const FlutterFoodApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /* Aqui vou passar todos os provedores(instancias) que quero passar para o App*/
      /* Facilitará criando uma unica instancia que poderá se acessada em qual parte do App */
      providers: [
        Provider<FoodsStore>(
          /* Aqui crio uma instancia que podera ser usada em qualquer parte do nosso App */
          create: (_) => FoodsStore(),
        ),
        Provider<CategoriesStore>(
          /* Aqui crio uma instancia que podera ser usada em qualquer parte do nosso App */
          create: (_) => CategoriesStore(),
        ),
        Provider<RestaurantsStore>(
          /* Aqui crio uma instancia que podera ser usada em qualquer parte do nosso App */
          create: (_) => RestaurantsStore(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlutterFood',
        theme: themeData,
        /* Essa será a tela, rota, inicial */
        initialRoute: '/',
        /* 
                  Aqui vamos trabalhar com a parte de roteamento nativa do Flutter  
                  String == Nome da Rota
                  WidgetBuilder == (A rota em si)
                */
        routes: Routes.routes,
      ),
    );
  }
}
