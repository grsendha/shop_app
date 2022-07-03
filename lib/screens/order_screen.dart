import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import '../provider/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/order_items.dart';
import '../widgets/app-drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName='/order-screen';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Order'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => OrderItem(
          orders.items[index],
        ),
        itemCount: orders.items.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
