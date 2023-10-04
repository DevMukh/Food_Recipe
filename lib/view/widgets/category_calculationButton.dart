import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/colors/colors.dart';

class Calories extends StatefulWidget {
  String name;
   Calories({super.key,required this.name});

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Colors.white,
    child: Text(widget.name,style: TextStyle(color: ColorsField.headingColor),));
  }
}
