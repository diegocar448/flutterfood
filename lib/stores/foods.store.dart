import 'package:flutterfood/models/Category.dart';
import 'package:mobx/mobx.dart';
import '../models/Food.dart';
part 'foods.store.g.dart';

class FoodsStore = _FoodsStoreBase with _$FoodsStore;

abstract class _FoodsStoreBase with Store {
  @observable
  ObservableList<Food> foods = ObservableList<Food>();

  @action
  void add(Food food) {
    foods.add(food);
  }

  @action
  void addAll(List<Food> foods) {
    foods.addAll(foods);
  }

  @action
  void removeFood(Food food) {
    foods.remove(food);
  }

  @action
  void clearFoods() {
    foods.clear(food);
  }
}
