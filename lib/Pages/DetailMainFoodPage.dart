// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sort_child_properties_last, unused_import, unnecessary_import, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Pages/Cart.dart';
import 'package:food_delivery_app/Pages/Mylist.dart';
import 'package:food_delivery_app/Pages/Products.dart';
import 'package:food_delivery_app/Pages/Skelton.dart';
import 'package:food_delivery_app/Pages/mycart.dart';
import 'package:food_delivery_app/Widgets/BoldText.dart';
import 'package:food_delivery_app/Widgets/IconWithText.dart';
import 'package:food_delivery_app/Widgets/LightText.dart';

class DetailMainFoodPage extends StatefulWidget {
  String FoodImage;
  String Title;
  int StarLength;
  String Comments;

  MyList obj;

  String Description;
  var Price;
  var actualPrice;
  DetailMainFoodPage({
    super.key,
    required this.obj,
    required this.actualPrice,
    required this.FoodImage,
    required this.Title,
    required this.StarLength,
    required this.Comments,
    required this.Description,
    required this.Price,
  });

  @override
  State<DetailMainFoodPage> createState() => _DetailMainFoodPageState();
}

class _DetailMainFoodPageState extends State<DetailMainFoodPage> {
  int counter = 1;

  var StorePrice = 0;
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 15, top: 40),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30)),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            size: 15,
                          ),
                        )),
                    Spacer(),
                    Stack(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 15, top: 40),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(30)),
                            child: IconButton(
                              onPressed: () {
                                if (isAdded == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Cart(
                                                object: widget.obj,
                                              )));
                                } else {
                                  Navigator.pushNamed(context, '/emptyCart');
                                }
                              },
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                size: 20,
                              ),
                            )),
                        isAdded
                            ? Container(
                                margin: EdgeInsets.only(
                                    right: 10, top: 28, left: 20),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: LightText(
                                    text: widget.obj.products.length.toString(),
                                    size: 15,
                                  ),
                                ))
                            : Container(),
                      ],
                    )
                  ],
                ),
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/" + widget.FoodImage),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 270),
                height: 490,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BoldText(
                            text: widget.Title,
                            size: 30,
                            font: "font9",
                          ),
                          Row(
                            children: [
                              Container(
                                child: Row(
                                  children: List.generate(5, (Starsindex) {
                                    return Icon(
                                      size: 16,
                                      Icons.star,
                                      color: Starsindex < widget.StarLength
                                          ? Colors.yellow
                                          : Colors.black.withOpacity(0.5),
                                    );
                                  }),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              BoldText(
                                  size: 15,
                                  color: Colors.grey,
                                  text:
                                      "{" + widget.StarLength.toString() + "}"),
                              SizedBox(
                                width: 12,
                              ),
                              BoldText(
                                size: 15,
                                text: widget.Comments,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              IconWithText(
                                icon: Icons.circle,
                                text: "Normal",
                                sizeText: 10,
                                colorIcon: Colors.yellow,
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              IconWithText(
                                icon: Icons.location_on,
                                text: "1.7km",
                                sizeText: 10,
                                colorIcon: Colors.greenAccent[400],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              IconWithText(
                                icon: Icons.access_alarm_rounded,
                                text: "32 Minutes",
                                sizeText: 10,
                                colorIcon: Colors.red.withOpacity(0.8),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              text: "Introduce",
                              font: "font11",
                              size: 30,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            LightText(
                              text: widget.Description,
                              size: 18,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                LightText(
                                  text: "Show More",
                                  size: 15,
                                  color: Colors.greenAccent.shade400,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.greenAccent.shade400,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 130,
                            ),
                          ],
                        ))
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              Container(
                //color: Colors.purple,
                margin: EdgeInsets.only(left: 15, top: 770, right: 15),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (counter > 1) {
                                setState(() {
                                  counter--;
                                  widget.Price =
                                      (widget.Price - widget.actualPrice);
                                });
                              }
                            },
                          ),
                          Text(
                            counter.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              if (counter < 20) {
                                setState(() {
                                  counter++;
                                  widget.Price =
                                      (widget.actualPrice + widget.Price);
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (isAdded == false) {
                          setState(() {
                            Products P = Products(
                                Image: widget.FoodImage,
                                Title: widget.Title,
                                Quantity: counter.toString(),
                                Price: widget.Price);

                            widget.obj.addToCart(P);

                            isAdded = true;
                          });
                        }
                      },
                      child: Container(
                        child: Expanded(
                          child: Row(
                            children: [
                              BoldText(
                                  color: Colors.white,
                                  text: isAdded
                                      ? "          Added to Cart"
                                      : "   Rs." +
                                          widget.Price.toString() +
                                          "  Add to Cart"),
                              SizedBox(
                                width: 30,
                              ),
                              // BoldText(
                              //   text: isAdded ? "add" : "Add to cart",
                              //   color: Colors.white,
                              // )
                            ],
                          ),
                        ),
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent[200],
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
