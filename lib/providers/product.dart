import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String name;
  final String id;
  final String processor;
  final String imageUrl;
  final String hdd;
  final String ssd;
  final String battery;
  final String ram;
  final double rating;
  bool isFav;
  final double price;

  Product(
      {@required this.name,
      @required this.id,
      @required this.imageUrl,
      @required this.battery,
      @required this.ram,
      this.processor,
      @required this.price,
      this.hdd,
      this.ssd,
      this.rating,
      this.isFav = false});

  void toggleFav() {
    isFav = !isFav;
    notifyListeners();
  }
}
