// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sort_child_properties_last, unused_import, unnecessary_import, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widgets/BoldText.dart';
import 'package:food_delivery_app/Widgets/Forms.dart';
import 'package:food_delivery_app/Widgets/LightText.dart';
import 'package:food_delivery_app/Widgets/ResponsiveButton.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: BoldText(
          text: "Login",
          font: "font10",
          size: 25,
        )),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 200),
            child: Column(
              children: [
                MyForm(
                    hintText: "Email",
                    obsecure: false,
                    controller: emailController),
                SizedBox(
                  height: 10,
                ),
                MyForm(
                    hintText: "Password",
                    obsecure: true,
                    controller: passwordController),
                SizedBox(
                  height: 20,
                ),
                ResponsiveButton(
                  width: 170,
                  icon: Icons.login,
                  text: "Login",
                  color: Colors.black38,
                  onTap: 'home',
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LightText(text: "Forgot Password?"),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // This Functionality Will be Added Later
                      },
                      child: LightText(
                        text: "Click here",
                        color: Colors.purple,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
