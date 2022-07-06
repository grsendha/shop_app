import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app-drawer.dart';
import './edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user_product_screen';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    print("running");
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: productData.items.length,
        itemBuilder: (_, index) => Column(
          children: [
            UserProductItem(productData.items[index].title,
                productData.items[index].imageUrl),
            Divider(),
          ],
        ),
      ),
    );
  }
}
