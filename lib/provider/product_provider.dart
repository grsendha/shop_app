import 'package:flutter/material.dart';
import '../models/products.dart';

class Product with ChangeNotifier {
  final List<Product> _items = [];

  final get items{
    return [..._items];
  }
}
