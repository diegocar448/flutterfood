import 'package:flutter/material.dart';

import './screens/speech/speech_page.dart';
import './screens/auth/register_page.dart';
import './screens/auth/login_page.dart';
import './screens/restaurants/restaurants_page.dart';
import './screens/foods/food_page.dart';
import './screens/carts/cart_page.dart';
import './screens/orders/order_page.dart';
import './screens/orders/evaluation_order.dart';
import './screens/order_details/order_details.dart';
import './screens/profile/profile_page.dart';

void main() => runApp(FlutterFoodApp());

class FlutterFoodApp extends StatelessWidget {
  const FlutterFoodApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterFood',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(147, 70, 248, 1),
          backgroundColor: Colors.white,
          accentColor: Colors.black,
          brightness: Brightness.dark),
      /* Essa será a tela, rota, inicial */
      initialRoute: '/',
      /* 
        Aqui vamos trabalhar com a parte de roteamento nativa do Flutter  
        String == Nome da Rota
        WidgetBuilder == (A rota em si)
      */
      routes: <String, WidgetBuilder>{
        '/': (context) => SpeechScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/restaurants': (context) => RestaurantsPage(),
        '/foods': (context) => FoodsScreen(),
        '/cart': (context) => CartScreen(),
        '/my-orders': (context) => OrdersScreen(),
        '/order_details': (context) => OrderDetailsScreen(),
        '/evaluation-order': (context) => EvaluationScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
