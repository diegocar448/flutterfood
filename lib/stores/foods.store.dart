import '../data/network/repositories/food_repository.dart';
import 'package:mobx/mobx.dart';
import '../models/Food.dart';
part 'foods.store.g.dart';

class FoodsStore = _FoodsStoreBase with _$FoodsStore;

abstract class _FoodsStoreBase with Store {
  FoodRepository _repository;

  _FoodsStoreBase() {
    _repository = new FoodRepository();
  }

  @observable
  ObservableList<Food> foods = ObservableList<Food>();  

  @observable  
  List<Map<String, dynamic>> cartItems = [];

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) => isLoading = value;

  @action
  void addFood(Food food) {
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
    foods.clear();
  }

  @action
  Future getFoods(String tokenCompany) async {
    /* Inicia preloader CircularProgressIndicator */
    setLoading(true);

    final response = await _repository.getFoods(tokenCompany);

    /* Finaliza preloader CircularProgressIndicator */
    setLoading(false);

    response.map((food) => addFood(Food.fromJson(food))).toList();
  }

  /* 
  Métodos de Cart
   */

  @action
  void addFoodCart(Food food) {
    print('addFoodCart');
    /* Aqui adicionamos o produto no carrinho */
    cartItems.add({
      'identify':food.identify,
      'qty':1,
      'product':food,
    });
    /* Pegar a lista e inserir na propria lista (touch) */
    foods = foods;
  }

  @action
  void removeFoodCart(Food food) {
    print('removeFoodCart');
    /* Aqui removemos o produto no carrinho, sempre verificando se é igual*/
    cartItems.removeWhere((element) => element['identify'] == food.identify);
    /* Pegar a lista e inserir na propria lista (touch) */
    foods = foods;
  }

  @action
  void clearCart() {
    print('clearCart');
    cartItems.clear();
    /* Pegar a lista e inserir na propria lista (touch) */
    foods = foods;
  }

  /* Método de incrementar */
  @action
  void incrementFoodCart(Food food){
    /* encontrar a comida que vai incrementar */
    final int index = cartItems.indeWhere((element) => element['identify'] == food.identify);

    /* Acessar a quantidade desse produto */
    cartItems[index]['qtd'] = cartItems[index]['qtd'] + 1
  }

  /* Método de decrementar */
  @action
  void decrementFoodCart(Food food){
    /* encontrar a comida que vai decrementar */
    final int index = cartItems.indeWhere((element) => element['identify'] == food.identify);

    /* Acessar a quantidade desse produto */
    cartItems[index]['qtd'] = cartItems[index]['qtd'] - 1

    /* se for 0 remove o produto do carrinho */
    if(cartItems[index]['qtd'] == 0)
    {
      removeFoodCart();
    }
  }

  /* Métodos para indicar se têm ou não produto no carrinho */
  @action
  bool inFoodCart(Food food) => cartItems.contains(food);
}
