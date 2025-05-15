// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:food_delivery_app/Pages/Products.dart';

class MyList {
  List<Products> products = [];

  late int total = 0;

  void addToCart(Products prod) {
    products.add(prod);
    total = total + prod.Price;
  }

  void removeFromCart(Products prod) {
    products.remove(prod);
    total = total - prod.Price;
  }
}
