// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/Mylist.dart';

class MyCart extends StatelessWidget {
  final MyList object;

  MyCart({Key? key, required this.object}) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: const Color.fromARGB(255, 183, 151, 148),
        child: ListView.builder(
            itemCount: object.products.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  child: Text(object.products[index].Quantity),
                ),
              );
            })),
      ),
    );
  }
}
