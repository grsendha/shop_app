import 'package:flutter/material.dart';
// import './models/products.dart';
import './widgets/product_items.dart';
import 'package:provider/provider.dart';
import './provider/product_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool isFav;
  ProductsGrid(this.isFav);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final products = isFav?productsData.favoriteItems:productsData.items;
    return GridView.builder(
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        // create: (ctx) => products[index],
        value:products[index],
        child: ProductItem(
            // products[index].id,
            // products[index].title,
            // products[index].imageUrl,
            ),
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
