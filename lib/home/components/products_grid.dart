import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_stop/providers/products_provider.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final loadedProducts =
        showFavs ? productsData.favItems : productsData.items;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: ProductItem(
            // id: loadedProducts[index].id,
            // name: loadedProducts[index].name,
            // imageUrl: 'assets/laptop.jpg',
            // isfav: false,
            // price: loadedProducts[index].price,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
