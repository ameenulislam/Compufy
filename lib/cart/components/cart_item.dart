import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './cart.dart';

class CartItem extends StatelessWidget {
  final String name;
  final String itemKey;
  final String id;
  final int quantity;
  final double price;

  CartItem({this.name, this.id, this.quantity, this.price, this.itemKey});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(itemKey);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Are you sure ?"),
                  content: Text("Do you want to remove item from cart ?"),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(fontSize: 16),
                        )),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: Text("Yes", style: TextStyle(fontSize: 16)))
                  ],
                ));
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
      ),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: ListTile(
          leading: Container(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "\$ $price",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          title: Text(name),
          subtitle: Text("Total: \$ ${price * quantity}"),
          trailing: Text(" $quantity x"),
        ),
      ),
    );
  }
}
