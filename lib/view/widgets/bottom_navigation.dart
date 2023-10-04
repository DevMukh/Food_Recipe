import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/view/screens/home_page.dart';

import '../../Auth/login_View.dart';

class BottomNavigationBarCreated extends StatefulWidget {
  const BottomNavigationBarCreated({super.key});

  @override
  State<BottomNavigationBarCreated> createState() => _BottomNavigationBarCreatedState();
}

class _BottomNavigationBarCreatedState extends State<BottomNavigationBarCreated> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  CurvedNavigationBar(
      key: _bottomNavigationKey,
      backgroundColor: Colors.green.shade900,
      color: Colors.white,
      items: <Widget>  [
        IconButton(
            onPressed: (){
              print("pressed1");
            },
            icon: Icon(Icons.home, size: 30)),
        IconButton(
            onPressed: (){
              print("pressed2");
            },
            icon: Icon(Icons.save, size: 30)),
        IconButton(onPressed:(){
          print("pressed3");
        },icon:Icon(Icons.logout, size: 30)),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
    );
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const login_View()));
  }
}
