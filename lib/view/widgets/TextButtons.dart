import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class ButtonWidget extends StatefulWidget {
  IconData icon;
  String text;
  Color btnColor;
  Color btnText;
  final route;
  ButtonWidget({super.key, required this.text, required this.icon,required this.btnColor,required this.btnText,required this.route});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor:widget.btnColor
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>widget.route));
      },
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(
              widget.icon,
              size: 25,
              color: ColorsField.textColor,
            ),
          ),
          const SizedBox(width: 10,),
          Text(
            widget.text,
            style:  TextStyle(
                color:widget.btnText, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
