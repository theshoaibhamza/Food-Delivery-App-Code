// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, non_constant_identifier_names, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sort_child_properties_last, unused_import, unnecessary_import, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable, body_might_complete_normally_nullable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Pages/Login.dart';
import 'package:food_delivery_app/Pages/MainFoodPage.dart';
import 'package:food_delivery_app/Widgets/BoldText.dart';
import 'package:food_delivery_app/Widgets/Forms.dart';
import 'package:food_delivery_app/Widgets/LightText.dart';
import 'package:food_delivery_app/Widgets/ResponsiveButton.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signup(String email, String password) async {
    UserCredential? usercredential;
    try {
      usercredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    } on FirebaseAuthException catch (ex) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sign Up Error"),
            content: Text(ex.message ?? "An error occurred during sign up"),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: BoldText(
          text: "Sign up",
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
                GestureDetector(
                  onTap: () {
                    signup(emailController.text.toString(),
                        passwordController.text.toString());
                  },
                  child: Container(
                    width: 170,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: Offset(10, 0),
                          child: BoldText(
                            text: "Sign-Up",
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.login,
                          size: 35,
                          color: Colors.white,
                        )
                        // logo
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black38,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LightText(text: "Already have account?"),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: LightText(
                        text: "Log-in",
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
