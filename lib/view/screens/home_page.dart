import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/colors/colors.dart';
import 'package:food_recipe/view/widgets/categories_ui.dart';

import '../widgets/bottom_navigation.dart';
import '../widgets/home_screen_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarCreated(),
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsField.background,
      appBar: AppBar(
        backgroundColor: ColorsField.background,
        // elevation: 2.0,
        centerTitle: true,
        title: const Text(
          "Bashir Recipe 🎊",
          style: TextStyle(
              color: ColorsField.headingColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find The Best Recipe',
                style: TextStyle(
                    color: ColorsField.headingColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const Text('For cooking ',
                  style: TextStyle(
                      color: ColorsField.headingColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: const Icon(
                    Icons.search_off_outlined,
                    color: ColorsField.greyColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.5, color: Colors.black),
                      borderRadius: BorderRadius.circular(20) //<-- SEE HERE
                      ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Colors.black), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Categories(
                      name: 'All',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // now work on home screen widg
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipPathContent(
                          dish_name: '',
                          belongs: '',
                          cooktime: '',
                          images: '',
                          ingridents: '', calories: '', fat: '', protein: '', carbohydrates: '', cholesterol: '',),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
