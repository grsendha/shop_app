// ignore_for_file: sdk_version_ui_as_code

import './cart.dart';
import 'package:flutter/foundation.dart';

class OrderItems {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItems({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Order with ChangeNotifier {
  final List<OrderItems> _items = [];

  List<OrderItems> get items {
    return [..._items];
  }

  void addItems(List<CartItem> cartProducts, double total) {
    _items.insert(
      0,
      OrderItems(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
  }
}
