import 'package:flutter/material.dart';

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime time;

  OrderItem({
    required this.amount,
    required this.id,
    required this.products,
    required this.time,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  bool addOrder(List<CartItem> cartProducts, double total) {
    if (cartProducts.isNotEmpty && total != 0.0) {
      _orders.insert(
          0,
          OrderItem(
              amount: total,
              id: DateTime.now().toString(),
              products: cartProducts,
              time: DateTime.now()));
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
