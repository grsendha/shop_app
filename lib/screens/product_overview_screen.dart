import 'package:flutter/material.dart';


import '../models/products.dart';

import '../product_grid.dart';

class ProductScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop App'),
      ),
      body: ProductsGrid(),
    );
  }
}
