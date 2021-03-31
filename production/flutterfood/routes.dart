import 'package:flutter/material.dart';

import './screens/speech/speech_page.dart';
import './screens/auth/register_page.dart';
import './screens/auth/login_page.dart';
import './screens/restaurants/restaurants_page.dart';
import 'screens/foods/foods_page.dart';
import './screens/carts/cart_page.dart';
import './screens/orders/order_page.dart';
import './screens/orders/evaluation_order.dart';
import './screens/order_details/order_details.dart';
import './screens/profile/profile_page.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
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
  };
}
