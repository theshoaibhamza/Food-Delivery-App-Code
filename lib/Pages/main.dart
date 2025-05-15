// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_import, duplicate_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Pages/Cart.dart';
import 'package:food_delivery_app/Pages/DetailMainFoodPage.dart';
import 'package:food_delivery_app/Pages/EmptyCart.dart';
import 'package:food_delivery_app/Pages/Login.dart';
import 'package:food_delivery_app/Pages/MainFoodPage.dart';
import 'package:food_delivery_app/Pages/Products.dart';
import 'package:food_delivery_app/Pages/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: MainFoodPage(),
        home: Login(),
        routes: {
          //'cart': (context) => Cart(),
          '/home': (context) => MainFoodPage(),
          '/emptyCart': (context) => EmptyCart()
        });
  }
}
