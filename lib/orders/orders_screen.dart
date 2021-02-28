import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_stop/orders/components/orders.dart' show Orders;
import 'package:shop_stop/widgets/navigation_drawer.dart';
import './components/orderItem.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Compufy",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      drawer: NavigationDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Your Orders",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black54),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: orders.orders.length,
                itemBuilder: (ctx, index) => OrderItem(orders.orders[index])),
          ),
        ],
      ),
    );
  }
}
