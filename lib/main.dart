import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_stop/admin/admin_products.dart';
import 'package:shop_stop/admin/edit_products.dart';
import 'package:shop_stop/cart/cart_screen.dart';
import 'package:shop_stop/orders/components/orders.dart';
import 'package:shop_stop/orders/orders_screen.dart';
import 'package:shop_stop/product_details/product_details.dart';
import 'package:shop_stop/providers/products_provider.dart';

import 'cart/components/cart.dart';
import 'home/products_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color(0xFF2ABB9C),
  100: Color(0xFF2ABB9C),
  200: Color(0xFF2ABB9C),
  300: Color(0xFF2ABB9C),
  400: Color(0xFF2ABB9C),
  500: Color(0xFF2ABB9C),
  600: Color(0xFF2ABB9C),
  700: Color(0xFF2ABB9C),
  800: Color(0xFF2ABB9C),
  900: Color(0xFF2ABB9C)
};

MaterialColor primaryColor = MaterialColor(0xFF2ABB9C, color);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        title: "Compufy",
        //app theming and styling
        theme: ThemeData(
            //color configs
            primarySwatch: primaryColor,
            accentColor: Color(0xFFFEBF63),
            canvasColor: Color(0xFFEBEBEB),
            //font
            fontFamily: 'Prompt',
            //appbar theme
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
            ),
            //text
            textTheme: TextTheme(
                headline6: TextStyle(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                headline1: TextStyle(
                    fontFamily: 'Prompt',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                bodyText1: TextStyle(fontFamily: 'Raleway', fontSize: 14))),
        //homepage starts here
        home: ProductsPage(),
        routes: {
          ProductDetails.routeName: (ctx) => ProductDetails(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          AdminProducts.routeName: (ctx) => AdminProducts(),
          EditProduct.routeName: (ctx) => EditProduct()
        },
      ),
    );
  }
}
