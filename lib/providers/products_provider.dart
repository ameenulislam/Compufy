import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: "p1",
        name: 'Iphone X',
        price: 1000.00,
        battery: "4000 mAh",
        processor: "Bionic A12",
        ram: "32 GB",
        imageUrl: "assets/laptop.jpg",
        rating: 5),
    Product(
        id: "p2",
        name: 'Iphone 11',
        price: 1400.00,
        battery: "4400 mAh",
        processor: "Bionic A14",
        ram: "64 GB",
        imageUrl: "assets/laptop.jpg",
        rating: 4),
    Product(
        id: "p3",
        name: 'Google pixel 4',
        price: 1000.00,
        battery: "4000 mAh",
        processor: "Snapdragon",
        ram: "32 GB",
        imageUrl: "assets/laptop.jpg",
        rating: 5),
    Product(
        id: "p4",
        name: 'Macbook pro',
        price: 1000.00,
        battery: "4000 mAh",
        processor: "Bionic A12",
        ram: "32 GB",
        imageUrl: "assets/laptop.jpg",
        rating: 5),
    Product(
        id: "p5",
        name: 'Oneplus nord',
        price: 1000.00,
        battery: "4000 mAh",
        processor: "Bionic A12",
        ram: "32 GB",
        imageUrl: "assets/laptop.jpg",
        rating: 4),
    Product(
        id: "p6",
        name: 'Asus ROG zephyrus',
        price: 3000.00,
        battery: "4000 mAh",
        processor: "Intel",
        ram: "32 GB",
        imageUrl: "assets/laptop.jpg",
        rating: 3),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> get favItems {
    return _items.where((prodItem) => prodItem.isFav).toList();
  }

  void addProduct(Product product) {
    const url =
        "https://udemy-shop-app-7c6ce-default-rtdb.firebaseio.com/products.json";
    http
        .post(url,
            body: json.encode({
              'name': product.name,
              'hdd': product.hdd,
              'price': product.price,
              'battery': product.battery,
              'imageUrl': "assets/laptop.jpg",
              'ram': product.ram,
            }))
        .then((response) {
      print(json.decode(response.body));
      final newProduct = Product(
        name: product.name,
        hdd: product.hdd,
        price: product.price,
        battery: product.battery,
        imageUrl: "assets/laptop.jpg",
        ram: product.ram,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    });
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
