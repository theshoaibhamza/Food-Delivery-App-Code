// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sort_child_properties_last, unused_import, unnecessary_import, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widgets/BoldText.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 200),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Center(
            child: Column(
              children: [
                Icon(
                    color: Colors.black.withOpacity(0.5),
                    size: 80,
                    Icons.remove_shopping_cart_outlined),
                SizedBox(
                  height: 25,
                ),
                BoldText(
                  color: Colors.black.withOpacity(0.6),
                  text: "Your Cart Is Empty",
                  font: "font11",
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
