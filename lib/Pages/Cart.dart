// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sort_child_properties_last, unused_import, unnecessary_import, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, sized_box_for_whitespace, collection_methods_unrelated_type

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Pages/Mylist.dart';
import 'package:food_delivery_app/Widgets/BoldText.dart';
import 'package:food_delivery_app/Widgets/LightText.dart';

class Cart extends StatefulWidget {
  final MyList object;

  Cart({super.key, required this.object});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        height: double.maxFinite,
        width: double.maxFinite,
        //color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                          color: Colors.black, Icons.arrow_back_ios_new_sharp)),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.greenAccent.shade400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: BoldText(
                font: "font11",
                text:
                    //"Your Cart Has\n" + widget.totalItems.toString() + " items",
                    "Your Cart Has\n" +
                        widget.object.products.length.toString() +
                        " item",
                size: 30,
              ),
            ),
            Container(
                height: 400,
                width: double.maxFinite,
                //color: Colors.blue,
                child: ListView.builder(
                    itemCount: widget.object.products.length,
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.only(top: 20),
                        height: 100,
                        width: double.maxFinite,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.pink,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage("assets/" +
                                              widget.object.products[index]
                                                  .Image))),
                                )
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BoldText(
                                      font: "font11",
                                      text: widget.object.products[index].Title,
                                      size: 25,
                                    ),
                                    BoldText(
                                        font: "font11",
                                        size: 15,
                                        color: Colors.black.withOpacity(0.4),
                                        text: "Quantity : " +
                                            widget.object.products[index]
                                                .Quantity)
                                  ],
                                )),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, right: 10),
                              child: Column(
                                children: [
                                  Transform.translate(
                                    offset: Offset(-10, -20),
                                    child: BoldText(
                                        size: 27,
                                        font: "font11",
                                        text: "Rs." +
                                            widget.object.products[index].Price
                                                .toString()),
                                  ),
                                  Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          widget.object.products
                                              .removeAt(index);
                                        });
                                      },
                                      child: Transform.translate(
                                        offset: Offset(-5, -13),
                                        child: Icon(
                                          size: 31,
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30)),
              height: 90,
              width: 400,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    BoldText(
                      text: "Total - ",
                      size: 30,
                      font: "font11",
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Spacer(),
                    BoldText(
                        font: "font11",
                        size: 30,
                        text: widget.object.total.toString())
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade400,
                    borderRadius: BorderRadius.circular(30)),
                height: 70,
                width: 300,
                child: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(left: 90, right: 20),
                    child: Row(
                      children: [
                        Center(
                          child: BoldText(
                            text: "Checkout ",
                            size: 30,
                            color: Colors.white,
                            font: "font11",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
