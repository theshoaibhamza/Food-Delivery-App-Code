// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/DetailMainFoodPage.dart';
import 'package:food_delivery_app/Pages/Mylist.dart';
import 'package:food_delivery_app/Widgets/BoldText.dart';
import 'package:food_delivery_app/Widgets/IconWithText.dart';
import 'package:food_delivery_app/Widgets/LightText.dart';

class MyBottomSlider extends StatelessWidget {
  List Names = [
    "Break Fast",
    "Pizza",
    "Finger Chips",
    "Chocolate",
    "Burger",
  ];

  List Comments = [
    "1287 Comments",
    "2345 Comments",
    "1645 Comments",
    "2456 Comments",
    "2045 Comments",
  ];

  List Prices = [
    500,
    1800,
    400,
    800,
    600,
  ];
  List Descriptions = [
    "Delightfully tasty and incredibly fulfilling, perfect for any meal.",
    "A timeless classic with a savory twist, sure to satisfy your cravings.",
    "Crunchy and delicious, offering a delightful burst of flavor in every bite.",
    "Sweet and indulgent, a decadent treat for those with a love for chocolate.",
    "Juicy and satisfying, a mouthwatering delight that leaves you wanting more.",
  ];

  List Images = [
    "9.jpg",
    "6.jpg",
    "10.jpg",
    "4.jpg",
    "5.jpg",
  ];
  List StarsLength = [4, 5, 3, 4, 4];
  MyList obj;
  MyBottomSlider({super.key, required this.obj});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 370,
        width: 380,
        //color: Colors.red,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(
                          milliseconds:
                              500), // Set the duration of the animation
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          DetailMainFoodPage(
                        FoodImage: Images[index],
                        actualPrice: Prices[index],
                        Title: Names[index],
                        StarLength: StarsLength[index],
                        Comments: Comments[index],
                        Description: Descriptions[index],
                        Price: Prices[index],
                        obj: obj,
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  height: 130,
                  width: 40,
                  //color: Colors.blue,
                  child: Row(
                    children: [
                      Container(
                        //margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                        height: 130,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/" + Images[index])),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Container(
                        height: 110,
                        width: 228,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/" + "white.png")),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(
                              text: "  " + Names[index],
                              size: 25,
                              font: "font11",
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            LightText(
                              text: "  " + Descriptions[index],
                              color: Colors.black.withOpacity(0.5),
                              size: 15,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                IconWithText(
                                  icon: Icons.circle,
                                  text: "Normal",
                                  colorIcon: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconWithText(
                                  icon: Icons.location_on,
                                  text: "1.7km",
                                  colorIcon: Colors.greenAccent[400],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconWithText(
                                    icon: Icons.access_alarm_rounded,
                                    colorIcon: Colors.red[400],
                                    text: "32min"),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ]);
  }
}
