import 'package:flutterfood/data/network/repositories/food_repository.dart';
import '../models/Order.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../data/network/repositories/order_repository.dart';
part 'orders.store.g.dart';

class OrdersStore = _OrdersStoreBase with _$OrdersStore;

abstract class _OrdersStoreBase with Store {
  /* Aqui ja podemos chamar os métodos de FoodRepository */
  OrderRepository _orderRepository = OrderRepository();

  @observable
  bool isMakingOrder = false;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Order> orders = ObservableList<Order>();

  @action
  Future makeOrder(String tokenCompany, List<Map<String, dynamic>> foods,
      {String comment}) async {
    /* fazendo Order  */
    isMakingOrder = true;

    await _orderRepository.makeOrder(tokenCompany, foods, comment: comment);

    /* Order ja feita  */
    isMakingOrder = false;
  }

  /* Add order */
  @action
  void add(Order order) {
    orders.add(order);
  }

  /* clear orders */
  @action
  void clear() {
    orders.clear();
  }

  /* action que vai recuperar os pedidos feitos */
  @action
  Future getMyOrders() async {
    clear();

    isLoading = true;
    final response = await _orderRepository.getMyOrders();
    print(response);

    response.map((order) => add(Order.fromJson(order))).toList();

    isLoading = false;
  }
}
