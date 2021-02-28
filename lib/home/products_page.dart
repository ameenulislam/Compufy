import 'package:flutter/material.dart';
import 'package:shop_stop/cart/cart_screen.dart';
import '../widgets/navigation_drawer.dart';
import 'components/categories.dart';
import 'components/products_grid.dart';

enum Filters { Favorites, All }

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool showOnlyFavs = false;
  @override
  Widget build(BuildContext context) {
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
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 1),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
            PopupMenuButton(
                onSelected: (Filters selectedValue) {
                  setState(() {
                    if (selectedValue == Filters.Favorites) {
                      showOnlyFavs = true;
                    } else {
                      showOnlyFavs = false;
                    }
                  });
                },
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text("Show Favourites"),
                        value: Filters.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text("Show All"),
                        value: Filters.All,
                      )
                    ])
          ],
        ),
        drawer: Drawer(
          child: NavigationDrawer(),
        ),
        //body
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Text(
                "Discover",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: Colors.black54),
              )),
              SizedBox(
                height: 10,
              ),
              //categories
              Categories(),
              //Products grid
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ProductsGrid(showOnlyFavs),
                ),
              ),
            ],
          ),
        ));
  }
}
