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
  double totalCart = 0;

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
    clearFoods();
    clearCart();

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

    /* Se esse produto ja estiver no carrinho ele não vai incrementar */
    if (inFoodCart(food)) {
      return incrementFoodCart(food);
    }

    /* Aqui adicionamos o produto no carrinho */
    cartItems.add({
      'identify': food.identify,
      'qty': 1,
      'product': food,
    });
    calcTotalCart();
  }

  @action
  void removeFoodCart(Food food) {
    print('removeFoodCart');
    /* Aqui removemos o produto no carrinho, sempre verificando se é igual*/
    cartItems.removeWhere((element) => element['identify'] == food.identify);
    /* Pegar a lista e inserir na propria lista (touch) */
    calcTotalCart();
  }

  @action
  void clearCart() {
    print('clearCart');
    cartItems.clear();

    calcTotalCart();
  }

  /* Método de incrementar */
  @action
  void incrementFoodCart(Food food) {
    print("incrementando");
    /* encontrar a comida que vai incrementar | recupera o indice do item*/
    final int index =
        cartItems.indexWhere((element) => element['identify'] == food.identify);

    /* Acessar a quantidade desse produto */
    cartItems[index]['qty'] = cartItems[index]['qty'] + 1;

    calcTotalCart();
  }

  /* Método de decrementar */
  @action
  void decrementFoodCart(Food food) {
    print("decrementando");
    /* encontrar a comida que vai decrementar | recupera o indice do item*/
    final int index =
        cartItems.indexWhere((element) => element['identify'] == food.identify);

    /* Acessar a quantidade desse produto */
    cartItems[index]['qty'] = cartItems[index]['qty'] - 1;

    /* se for 0 remove o produto do carrinho */
    if (cartItems[index]['qty'] == 0) {
      /* Adicionamos o return para encerrar aqui (Não tem necessidade de rodar o calcTotalCart() novamente) */
      return removeFoodCart(food);
    }

    calcTotalCart();
  }

  /* Métodos para indicar se têm ou não produto no carrinho */
  @action
  bool inFoodCart(Food food) {
    /* Aqui eu recupero o indice do item*/
    final int index =
        cartItems.indexWhere((element) => element['identify'] == food.identify);

    return index != -1;
  }

  /* Calcular o total do carrinho */
  @action
  double calcTotalCart() {
    print("calcTotalCart");
    //print(cartItems);
    double total = 0;

    /* Pegar o valor do produto multiplicar pela qtd e somar com o total do carrinho */
    cartItems
        .map((element) =>
            total += element['qty'] * double.parse(element['product'].price))
        .toList();

    /* Total cart recebe o valor atualizado */
    totalCart = total;

    /* Pegar a lista e inserir na propria lista (touch) (Forçando a atualização)*/
    foods = foods;
    /* Fazer touch em cartItems tbm */
    cartItems = cartItems;

    //print(cartItems[0]['qty'].price);
    return total;
  }
}
