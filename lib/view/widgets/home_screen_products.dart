import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:food_recipe/colors/colors.dart';
import 'package:food_recipe/view/screens/Pakistani_Food.dart';

class ClipPathContent extends StatefulWidget {
  String dish_name;
  String belongs;
  String images;
  String ingridents;
  String cooktime;
  String calories;
  String fat;
  String protein;
  String carbohydrates;
  String cholesterol;
  ClipPathContent(
      {super.key,
      required this.dish_name,
      required this.belongs,
      required this.images,
      required this.ingridents,
      required this.cooktime,
      required this.calories,
      required this.fat,
      required this.protein,
      required this.carbohydrates,
      required this.cholesterol});

  @override
  State<ClipPathContent> createState() => _ClipPathContentState();
}

class _ClipPathContentState extends State<ClipPathContent> {
  String id = '';
  final _streamBuilder =
      FirebaseFirestore.instance.collection("Products").snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _streamBuilder,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SnackBar(
                content: Text('Failed to load, there was an error.'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
                backgroundColor: Colors.white,
              ),
            );
          }
          var docs = snapshot.data!.docs;
          return Row(
            children: [
              for (var index = 0; index < docs.length; index++)
                ClipPath(
                  clipper: SideCutClipper(),
                  child: InkWell(
                    onTap: () {
                      gettingId(docs[index]['dish_name']);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 250,
                      height: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pink,
                          image: DecorationImage(
                              image: NetworkImage(docs[index]['images']),
                              fit: BoxFit.fill)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.save,
                                    color: ColorsField.whiteIcons,
                                    size: 30,
                                  )),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    docs[index]['dish_name'],
                                    style: const TextStyle(
                                        color: ColorsField.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  Text(docs[index]['belongs'],
                                      style: const TextStyle(
                                          color: ColorsField.textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                  Text(
                                      docs[index]['ingridents'] +
                                          '\tIngredients' +
                                          '\n' +
                                          docs[index]['cooktime'] +
                                          "\thours required",
                                      style: const TextStyle(
                                          color: ColorsField.textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        });
  }

  void gettingId(String dish_name) async {
    var collection = FirebaseFirestore.instance.collection('Products');
    var query = await collection.where('dish_name', isEqualTo: dish_name).get();
    if (query.docs.isNotEmpty) {
      var selectedItem = query.docs.first;
      var documentId = selectedItem.id;
      String images = selectedItem.get('images');
      String belongs = selectedItem.get('belongs');
      String cooktime = selectedItem.get('cooktime');
      String ingridents = selectedItem.get('ingridents');
      String calories = selectedItem.get('calories');
      String fat = selectedItem.get('fat');
      String protein = selectedItem.get('protein');
      String carbohydrates = selectedItem.get('carbohydrates');
      String cholesterol = selectedItem.get('cholesterol');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PakistaniFood(
                    id: documentId,
                    dishName: dish_name,
                    images: images,
                    belongs: belongs,
                    ingridents: ingridents,
                    cooktime: cooktime,
                    calories: calories,
                    fat: fat,
                    protein: protein,
                    carbohydrates: carbohydrates,
                    cholesterol: cholesterol, video: '',
                  )));
      print("You selected item $documentId");
    }
  }
}
