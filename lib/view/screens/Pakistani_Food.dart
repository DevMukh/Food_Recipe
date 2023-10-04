import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/colors/colors.dart';
import 'package:food_recipe/view/screens/recipee_detail.dart';
import 'package:food_recipe/view/widgets/TextButtons.dart';
import 'package:food_recipe/view/widgets/category_calculationButton.dart';
import 'package:food_recipe/view/widgets/category_detail.dart';

class PakistaniFood extends StatefulWidget {
  String dishName;
  String images;
  String id;
  String belongs;
  String ingridents;
  String cooktime;
  String calories;
  String fat;
  String protein;
  String carbohydrates;
  String cholesterol;
  String video;

  PakistaniFood(
      {Key? key,
      required this.video,
      required this.id,
      required this.dishName,
      required this.images,
      required this.belongs,
      required this.ingridents,
      required this.cooktime,
      required this.calories,
      required this.fat,
      required this.protein,
      required this.carbohydrates,
      required this.cholesterol})
      : super(key: key);

  @override
  State<PakistaniFood> createState() => _PakistaniFoodState();
}

class _PakistaniFoodState extends State<PakistaniFood> {
  final stream = FirebaseFirestore.instance.collection('Products').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsField.transparentColor,
          title: const Text(
            "Pakistani Food",
            style: TextStyle(
                color: ColorsField.headingColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 3,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.images),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        // Wrap the Column in SingleChildScrollView
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              widget.dishName, // Use widget.dishName
                              style: const TextStyle(
                                color: ColorsField.headingColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.belongs,
                              // 'Beery Smooth Salad Time',
                              style: const TextStyle(
                                color: ColorsField.headingColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.cooktime + ' hours requried',
                              style: const TextStyle(
                                  color: ColorsField.headingColor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Ingredients',
                              style: TextStyle(
                                color: ColorsField.headingColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SingleChildScrollView(
                              // Wrap the Row in SingleChildScrollView
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CategoryDetail(productId:widget.id ,),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        ColorsField.buttonColorBackground,
                                    fixedSize: const Size.fromWidth(350)),
                                onPressed: () {
                                  getIdofcontect();
                                },
                                child: const Text(
                                  'Get Details',
                                  style: TextStyle(
                                      color: ColorsField.headingColor),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void getIdofcontect() async {
    var refference = FirebaseFirestore.instance.collection('Products');
    var querysnapshot =
        await refference.where('images', isEqualTo: widget.images).get();
    if (querysnapshot.docs.isNotEmpty) {
      var selected = querysnapshot.docs.first;
      var documentId = selected.id;
      var video = selected.get('video');
      var calories = selected.get('calories');
      var name = selected.get('dish_name');
      var fat = selected.get('fat');
      var protein = selected.get('protein');
      var carbohydrates = selected.get('carbohydrates');
      var cholesterol = selected.get('cholesterol');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RecipeDetail(
                    video: video,
                    name: name,
                    calories: calories,
                    fat: fat,
                    protein: protein,
                    carbohydrates: carbohydrates,
                    cholesterol: cholesterol,
                  )));
    }
  }
}
