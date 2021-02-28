import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_stop/orders/components/orders.dart';

import './components/cart.dart';
import './components/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Your Cart",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //cart Items.
            Expanded(
                child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (ctx, i) => ci.CartItem(
                          id: cart.items.values.toList()[i].id,
                          itemKey: cart.items.keys.toList()[i],
                          name: cart.items.values.toList()[i].name,
                          price: cart.items.values.toList()[i].price,
                          quantity: cart.items.values.toList()[i].quantity,
                        ))),
            //the summary card.
            SizedBox(
              height: 10,
            ),
            Text(
              "Swipe items from right to left to dismiss!",
              style: TextStyle(color: Colors.black45),
            ),
            Card(
              elevation: 6,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Total: ",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Chip(
                        label: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            "\$ ${cart.totalAmount}",
                            style: TextStyle(
                                // color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        backgroundColor: Theme.of(context).accentColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false)
                        .addOrder(cart.totalAmount, cart.items.values.toList());
                    cart.clear();
                  },
                  color: Theme.of(context).accentColor,
                  child: Container(
                      width: 340,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_basket,
                            // color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Place Order",
                            style: TextStyle(
                                // color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
