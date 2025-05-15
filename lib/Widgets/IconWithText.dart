// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/Widgets/BoldText.dart';

class IconWithText extends StatelessWidget {
  IconWithText(
      {super.key,
      this.colorText = Colors.black,
      required this.icon,
      this.colorIcon = Colors.black,
      this.sizeIcon,
      this.sizeText,
      required this.text});

  String text;
  final icon;
  Color? colorText;
  Color? colorIcon;
  double? sizeText;
  double? sizeIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: colorIcon,
          size: sizeIcon,
        ),
        SizedBox(
          width: 5,
        ),
        BoldText(
          size: 10,
          text: text,
          color: colorText?.withOpacity(0.5),
        ),
      ],
    );
  }
}
