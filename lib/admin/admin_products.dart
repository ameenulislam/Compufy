import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_stop/admin/components/admin_items.dart';
import 'package:shop_stop/admin/edit_products.dart';
import 'package:shop_stop/providers/products_provider.dart';
import 'package:shop_stop/widgets/navigation_drawer.dart';

class AdminProducts extends StatelessWidget {
  static const routeName = '/AdminProducts';
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Your Products",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProduct.routeName);
                })
          ],
        ),
        drawer: NavigationDrawer(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: product.items.length,
            itemBuilder: (ctx, i) => AdminItems(
              id: product.items[i].id,
              name: product.items[i].name,
              imageUrl: product.items[i].imageUrl,
              price: product.items[i].price,
            ),
          ),
        ));
  }
}
