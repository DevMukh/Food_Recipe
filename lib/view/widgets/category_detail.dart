import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatefulWidget {
  final String productId; // Add a productId parameter
  CategoryDetail({super.key, required this.productId});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Products')
          .doc(widget.productId) // Use the provided productId
          .collection('Pak')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SnackBar(
              content: Text('Something went wrong while loading images'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        }
        var docs = snapshot.data!.docs;
        return Row(
          children: [
            for (var i = 0; i < docs.length; i++)
              Container(
                margin: const EdgeInsets.only(right: 20),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(docs[i]['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
