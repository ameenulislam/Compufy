import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_stop/orders/components/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    var expanded = false;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        children: [
          ListTile(
            title: Text('\$ ${widget.order.amount}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            // trailing: IconButton(
            //     icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
            //     onPressed: () {
            //       setState(() {
            //         expanded = !expanded;
            //       });
            //     }),
          ),
          if (expanded)
            Container(
              height: min(widget.order.product.length * 20.0 + 100, 180),
              child: ListView(
                children: widget.order.product
                    .map((prod) => Row(
                          children: [
                            Text(prod.name),
                            Text("x ${prod.quantity} \$${prod.price}")
                          ],
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
