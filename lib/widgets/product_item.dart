import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_stop/cart/cart_screen.dart';
import 'package:shop_stop/cart/components/cart.dart';
import 'package:shop_stop/product_details/product_details.dart';
import 'package:shop_stop/providers/product.dart';

class ProductItem extends StatefulWidget {
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetails.routeName, arguments: products.id);
        },
        child: Card(
          color: Colors.white,
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //product image
              Image(image: AssetImage('assets/laptop.jpg')),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //item name and fav button
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      products.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 16, color: Colors.black),
                    )),
                    //add-to-fav button
                    Consumer<Product>(
                      builder: (ctx, product, child) => IconButton(
                          icon: Icon(
                            products.isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            products.toggleFav();
                          }),
                    )
                  ],
                ),
              ),
              // price and buy button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "\$ " + products.price.toString(),
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          color: Theme.of(context).primaryColor, fontSize: 15),
                    )),
                    SizedBox(
                      width: 60,
                      child: RaisedButton(
                        onPressed: () {
                          cart.addItem(
                              products.id, products.price, products.name);
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                        color: Colors.orange,
                        child: Text(
                          "Buy",
                          style: TextStyle(fontFamily: 'Prompt', fontSize: 14),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
