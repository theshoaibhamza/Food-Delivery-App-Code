// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, sort_child_properties_last, unused_import, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names, unnecessary_import, avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Pages/BottomSlider.dart';
import 'package:food_delivery_app/Pages/Mylist.dart';
import 'package:food_delivery_app/Pages/Skelton.dart';
import 'package:food_delivery_app/Pages/SkeltonPage.dart';
import 'package:food_delivery_app/Widgets/BoldText.dart';
import 'package:food_delivery_app/Widgets/IconWithText.dart';
import 'package:food_delivery_app/Widgets/LightText.dart';
import 'package:food_delivery_app/Widgets/Slider.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  late bool isLoaded = false;
  MyList obj = MyList();
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.99),
      body: isLoaded
          ? Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            BoldText(
                              text: "Pakistan",
                              font: "font30",
                              size: 25,
                              color: Colors.greenAccent[400],
                            ),
                            Row(
                              children: [
                                LightText(
                                  text: "Lahore",
                                  color: Colors.black,
                                  font: "font30",
                                  size: 15,
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 235,
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent[400],
                          ),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                  MySlider(
                    obj: obj,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        BoldText(text: "Popular"),
                        SizedBox(
                          width: 30,
                        ),
                        LightText(
                          text: "Food Pairing",
                          size: 12,
                          color: Colors.black.withOpacity(0.3),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Expanded(
                    child: MyBottomSlider(
                      obj: obj,
                    ),
                  )
                ],
              ),
            )
          : SkeltonPage(),
    );
  }
}
