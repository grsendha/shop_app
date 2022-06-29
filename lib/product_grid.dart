import 'package:flutter/material.dart';
// import './models/products.dart';
import './widgets/product_items.dart';
import 'package:provider/provider.dart';
import './provider/product_provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = productsData.items;
    return GridView.builder(
      itemBuilder: (context, index) => ProductItem(
        products[index].id,
        products[index].title,
        products[index].imageUrl,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20),
      itemCount: products.length,
    );
  }
}
