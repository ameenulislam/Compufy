import 'package:flutter/material.dart';
import 'package:shop_stop/admin/admin_products.dart';
import 'package:shop_stop/orders/orders_screen.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  Widget buildItem(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 10,
        ),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.store,
            color: Colors.black,
          ),
          title: Text(
            "Shop",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => Navigator.of(context).pushReplacementNamed('/'),
        ),
        Divider(
          color: Colors.black54,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(
            Icons.receipt,
            color: Colors.black,
          ),
          title: Text(
            "Your Orders",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => Navigator.of(context).pushNamed(OrderScreen.routeName),
        ),
        Divider(
          color: Colors.black54,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(
            Icons.list,
            color: Colors.black,
          ),
          title: Text(
            "Manage Products",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => Navigator.of(context).pushNamed(AdminProducts.routeName),
        ),
        Divider(
          color: Colors.black54,
          thickness: 1,
        ),
      ],
    );
  }
}
