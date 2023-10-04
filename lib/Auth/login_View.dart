import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/Auth/register_page.dart';
import 'package:food_recipe/view/screens/home_page.dart';
import 'package:food_recipe/view/widgets/TextButtons.dart';

import '../colors/colors.dart';

class login_View extends StatefulWidget {
  const login_View({super.key});

  @override
  State<login_View> createState() => _login_ViewState();
}

class _login_ViewState extends State<login_View> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.jpg'), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: ColorsField.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                            color: ColorsField.headingColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter valid email";
                          }
                          if (!value.contains('@')) {
                            return "must be a valid email";
                          }
                          if (!value.contains('gmail.com')) {
                            return "email have gmail.com";
                          }
                          return null;
                        },
                        controller: email,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            hintText: 'enter email address',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "enter a password";
                          }
                          if (value.length < 8) {
                            return "password must be at least 8 characters";
                          }
                          if (!value.contains(RegExp(r'[A-Z]'))) {
                            return "Password must contain at least one uppercase letter";
                          }
                          if (!value.contains(RegExp(r'[a-z]'))) {
                            return "Password must contain at least one lowercase letter";
                          }
                          if (!value
                              .contains(RegExp(r'[!@#\$%^&*()<>?/|}{~:]'))) {
                            return "Password must contain at least one special character";
                          }
                          if (!value.contains(RegExp(r'[0-9]'))) {
                            return "Password must contain at least one numeric character";
                          }
                          return null;
                        },
                        controller: password,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            hintText: 'enter email address',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  ColorsField.buttonColorBackground,
                              fixedSize: const Size(150, 40)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 16, color: ColorsField.textColor),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                color: ColorsField.headingColor, fontSize: 11),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const register_Page()));
                                debugPrint('Pressed');
                              },
                              icon: const Icon(
                                Icons.app_registration,
                                color: Colors.black,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  // void loginAuth() async {
  //   try {
  //     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email.text,
  //       password: password.text,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  void login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.toLowerCase(), password: password.text);
    navigation();
  }

  void navigation() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>const HomePage()));
    email.text = "";
    password.text = "";
  }
}
