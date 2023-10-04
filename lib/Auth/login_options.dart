import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/Auth/login_View.dart';
import 'package:food_recipe/Auth/register_page.dart';
import 'package:food_recipe/view/widgets/TextButtons.dart';

import '../colors/colors.dart';

class options extends StatefulWidget {
  const options({super.key});

  @override
  State<options> createState() => _optionsState();
}

class _optionsState extends State<options> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsField.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login_option.jpg'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Recipe',
                style: TextStyle(
                    color: ColorsField.headingColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const Text(
                'Help you to cook healthy food ',
                style: TextStyle(
                    color: ColorsField.headingColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonWidget(
                text: 'Register',
                icon: Icons.add,
                btnColor: Colors.orange,
                btnText: ColorsField.textColor, route: const register_Page(),
              ),
              const SizedBox(
                height: 5,
              ),
              ButtonWidget(
                text: 'Sign In',
                icon: Icons.login,
                btnColor: ColorsField.greyColor,
                btnText: ColorsField.headingColor, route: const login_View(),
              ),

            ],
          ),
        ),
      ),
    ));
  }
}
