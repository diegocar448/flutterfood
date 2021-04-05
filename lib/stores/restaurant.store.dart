import 'package:flutterfood/models/Restaurant.dart';
import 'package:mobx/mobx.dart';
import '../models/Restaurant.dart';

part 'restaurant.store.g.dart';

class RestaurantsStore = _RestaurantsStoreBase with _$RestaurantsStore;

abstract class _RestaurantsStoreBase with Store {
  @observable
  Restaurant restaurant = null;

  /* vamos criar uma action para setar o valor do restaurant */
  @action
  void setRestaurant(Restaurant value) => restaurant = value;
}
