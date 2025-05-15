// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_final_fields, sort_child_properties_last, unused_import, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, non_constant_identifier_names, unnecessary_import, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Pages/Skelton.dart';
import 'package:food_delivery_app/Widgets/BoldText.dart';
import 'package:food_delivery_app/Widgets/LightText.dart';

class SkeltonPage extends StatefulWidget {
  const SkeltonPage({super.key});

  @override
  State<SkeltonPage> createState() => _SkeltonPageState();
}

class _SkeltonPageState extends State<SkeltonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        height: double.maxFinite,
        width: double.maxFinite,
        //color: Colors.red,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
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
                    width: 225,
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
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Skelton(
                      height: 200,
                      width: 400,
                    ),
                    Transform.translate(
                        offset: Offset(0, -60),
                        child: Skelton(
                            left: 10, right: 10, height: 130, width: 380)),
                    Row(
                      children: [
                        Skelton(
                          height: 35,
                          width: 80,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Skelton(
                          height: 25,
                          width: 80,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                        children: List.generate(2, (index) {
                      return Skelton(
                        height: 140,
                        top: 10,
                        width: double.maxFinite,
                      );
                    })),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
