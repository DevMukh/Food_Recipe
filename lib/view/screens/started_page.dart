import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/Auth/login_options.dart';
import 'package:food_recipe/view/widgets/TextButtons.dart';

import '../../colors/colors.dart';

class started_page extends StatefulWidget {
  const started_page({super.key});

  @override
  State<started_page> createState() => _started_pageState();
}

class _started_pageState extends State<started_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    // color: Colors.purple,
                    image: DecorationImage(
                        image: AssetImage('assets/start.jpg'),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding:const  EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const  Text(
                        'Cooking experience like a chief',
                        style: TextStyle(
                            color: ColorsField.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const   Text(
                        'Here you can find more interesting and outstanding quality of food hopefully',
                        style: TextStyle(color: ColorsField.textColor),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10,),
                      ButtonWidget(text: 'check', icon: Icons.move_down, btnColor: Colors.white12, btnText: ColorsField.headingColor, route: const options(),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
