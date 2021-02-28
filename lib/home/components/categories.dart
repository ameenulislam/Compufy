import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Mobile",
    "Laptop",
    "PC",
    "Smart Watches",
    "Smart Accessories",
    "Smart Tv",
    "Accessories"
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return buildCategory(index);
            }));
  }

  Widget buildCategory(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: index == selectedIndex
                      ? Theme.of(context).primaryColor
                      : Color.fromRGBO(42, 187, 156, 0.5),
                  fontSize: 15),
            ),
          ),
          Container(
            color: selectedIndex == index
                ? Theme.of(context).accentColor
                : Colors.transparent,
            height: 2,
            width: 20,
          )
        ],
      ),
    );
  }
}
