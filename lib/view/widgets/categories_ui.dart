import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/colors/colors.dart';
import 'package:food_recipe/view/screens/Pakistani_Food.dart';

class Categories extends StatefulWidget {
  String name;
  Categories({super.key, required this.name});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final _stream =
      FirebaseFirestore.instance.collection('Items_List').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _stream,
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
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey.shade50,
                  ),
                  child: Center(
                      child: TextButton(
                    onPressed: () {
                      if (index == 1) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PakistaniFood(id: '',)));
                      }
                    },
                    child: Text(
                      docs[index]['Category'],
                      style: const TextStyle(color: ColorsField.headingColor),
                    ),
                  )),
                ),
            ],
          );
        });
  }
}
