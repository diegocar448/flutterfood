import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/Restaurant.dart';
import './widgets/RestaurantCard.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../data/network/repositories/restaurant_repository.dart';

class RestaurantsPage extends StatefulWidget {
  RestaurantsPage({Key key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  /* simulando listagem de test */
  List<Restaurant> _restaurants = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurantes'),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: isLoading
            ? CircularProgressIndicator()
            : _buildRestaurants(context),
        bottomNavigationBar: FlutterFoodBottomNavigator(0));
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

  void getRestaurants() async {
    setState(() => isLoading = true);

    final restaurants = await RestaurantRepository().getRestaurants();

    setState(() {
      _restaurants.addAll(restaurants);
    });

    setState(() => isLoading = false);
  }
}
