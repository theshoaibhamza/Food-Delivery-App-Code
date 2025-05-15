// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_interpolation_to_compose_strings, sort_child_properties_last, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/DetailMainFoodPage.dart';
import 'package:food_delivery_app/Pages/Mylist.dart';
import 'package:food_delivery_app/Widgets/BoldText.dart';
import 'package:food_delivery_app/Widgets/IconWithText.dart';

// ignore: must_be_immutable
class MySlider extends StatefulWidget {
  MyList obj;
  MySlider({
    super.key,
    required this.obj,
  });

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  int index = 0;
  List Images = [
    "9.jpg",
    "6.jpg",
    "10.jpg",
    "4.jpg",
    "5.jpg",
  ];
  List Names = [
    "Break Fast",
    "Pizza",
    "Finger Chips",
    "Chocolate",
    "Burger",
  ];
  List Prices = [
    500,
    1800,
    400,
    800,
    600,
  ];

  List Descriptions = [
    "Start your day with this delightful breakfast\nchoice. Freshly made pancakes served with\nsyrup, fruits, and whipped cream.It's a feast\nfor your taste buds that will leave you feeling\nenergized and ready to take on the day!",
    "Experience the ultimate pizza indulgence with our classic favorite.\n A crispy crust topped with gooey cheese, savory tomato sauce, and a medley of delicious toppings like pepperoni, mushrooms, and olives.\n Perfect for sharing with friends and family!\n",
    "Satisfy your snack cravings with our crispy and addictive finger chips.\n Made from the finest potatoes, thinly sliced and perfectly fried to golden perfection.\n Enjoy them on their own or with your favorite dipping sauce for an irresistible treat!\n",
    "Indulge in the rich taste of chocolate with this decadent dessert.\n Layers of moist chocolate cake filled with velvety chocolate ganache and topped with a smooth chocolate frosting.\n It's a chocolate lover's dream come true!\n",
    "Sink your teeth into our mouthwatering burger masterpiece.\n A juicy beef patty grilled to perfection, topped with fresh lettuce, ripe tomatoes, onions, and pickles, all sandwiched between a soft sesame seed bun.\n It's burger perfection!\n"
  ];

  List StarsLength = [4, 5, 3, 4, 4];

  List Comments = [
    "1287 Comments",
    "2345 Comments",
    "1645 Comments",
    "2456 Comments",
    "2045 Comments",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 360,
          width: double.maxFinite,
          //color: Colors.red,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: ((context, index) {
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
                          obj: widget.obj,
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
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10, left: 10, top: 10),
                        height: 220,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/" + Images[index])),
                            // color: index.isEven
                            //   ? Colors.grey[800]
                            // : Colors.brown[900],
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Container(
                        child: Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(
                                text: Names[index],
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
                                          color: Starsindex < StarsLength[index]
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
                                      text: "{" +
                                          StarsLength[index].toString() +
                                          "}"),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  BoldText(
                                    size: 15,
                                    text: Comments[index],
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
                        margin: EdgeInsets.only(right: 10, left: 30, top: 170),
                        height: 130,
                        width: 350,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 15,
                                  color: Colors.black.withOpacity(0.1)),
                              BoxShadow(
                                  offset: Offset(-5, 0), color: Colors.white),
                              BoxShadow(
                                  offset: Offset(5, 0), color: Colors.white)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      Container(
                        height: 50,
                        width: double.maxFinite,
                        //color: Colors.red,
                        child: Row(
                            children: List.generate(5, (dotindex) {
                          return Transform.translate(
                            offset: Offset(165, 310),
                            child: Container(
                              margin: EdgeInsets.only(right: 4),
                              child: BoldText(text: "   "),
                              height: 10,
                              width: dotindex == index ? 20 : 10,
                              decoration: BoxDecoration(
                                  color: dotindex == index
                                      ? Colors.greenAccent[400]
                                      : Colors.green.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(160)),
                            ),
                          );
                        })),
                      ),
                    ],
                  ),
                );
              })),
        ),
      ],
    );
  }
}
