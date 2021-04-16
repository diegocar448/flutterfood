// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrdersStore on _OrdersStoreBase, Store {
  final _$isMakingOrderAtom = Atom(name: '_OrdersStoreBase.isMakingOrder');

  @override
  bool get isMakingOrder {
    _$isMakingOrderAtom.reportRead();
    return super.isMakingOrder;
  }

  @override
  set isMakingOrder(bool value) {
    _$isMakingOrderAtom.reportWrite(value, super.isMakingOrder, () {
      super.isMakingOrder = value;
    });
  }

  final _$ordersAtom = Atom(name: '_OrdersStoreBase.orders');

  @override
  ObservableList<Order> get orders {
    _$ordersAtom.reportRead();
    return super.orders;
  }

  @override
  set orders(ObservableList<Order> value) {
    _$ordersAtom.reportWrite(value, super.orders, () {
      super.orders = value;
    });
  }

  final _$makeOrderAsyncAction = AsyncAction('_OrdersStoreBase.makeOrder');

  @override
  Future<dynamic> makeOrder(
      String tokenCompany, List<Map<String, dynamic>> foods,
      {String comment}) {
    return _$makeOrderAsyncAction
        .run(() => super.makeOrder(tokenCompany, foods, comment: comment));
  }

  final _$getMyOrdersAsyncAction = AsyncAction('_OrdersStoreBase.getMyOrders');

  @override
  Future<dynamic> getMyOrders() {
    return _$getMyOrdersAsyncAction.run(() => super.getMyOrders());
  }

  @override
  String toString() {
    return '''
isMakingOrder: ${isMakingOrder},
orders: ${orders}
    ''';
  }
}
