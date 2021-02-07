import 'package:flutter/material.dart';

import '../../models/Restaurant.dart';
import './widgets/RestaurantCard.dart';

class RestaurantsPage extends StatefulWidget {
  RestaurantsPage({Key key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  /* simulando listagem de test */
  List<Restaurant> _restaurants = [
    Restaurant(
        name: "Empresa tal",
        image: '',
        contact: 'empresatal@gmail.com',
        uuid: '12345678'),
    Restaurant(
        name: "Empresa Essa",
        image: '',
        contact: 'empresaessa@gmail.com',
        uuid: '87654321'),
    Restaurant(
        name: "IMLanches",
        image: '',
        contact: 'imlanches@gmail.com',
        uuid: '12312312'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildRestaurants(context),
    );
  }

  Widget _buildRestaurants(context) {
    return Container(
      child: ListView.builder(
        itemCount: _restaurants.length,
        /* Aqui ele vai construir item por item */
        itemBuilder: (context, index) {
          final Restaurant restaurant = _restaurants[index];

          return RestaurantCard(
            uuid: restaurant.uuid,
            name: restaurant.name,
            image: restaurant.image,
            contact: restaurant.contact,
          );
        },
      ),
    );
  }
}
