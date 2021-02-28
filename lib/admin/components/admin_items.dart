import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_stop/providers/products_provider.dart';

class AdminItems extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final String id;

  AdminItems({this.imageUrl, this.name, this.price, this.id});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: (ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(imageUrl)),
          title: Text(name),
          subtitle: Text("\$ $price"),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () {
                      Provider.of<ProductsProvider>(context).deleteProduct(id);
                    })
              ],
            ),
          ),
        )),
      ),
    );
  }
}
