import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import '../colors/colors.dart';
import '../view/widgets/TextButtons.dart';
import 'login_View.dart';

class register_Page extends StatefulWidget {
  const register_Page({super.key});

  @override
  State<register_Page> createState() => _register_PageState();
}

class _register_PageState extends State<register_Page> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController re_password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    re_password.dispose();
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
                image: AssetImage('assets/register.jpg'), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 1.5,
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
                        'Register',
                        style: TextStyle(
                            color: ColorsField.headingColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
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
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            hintText: 'set your password',
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
                          if (re_password.text != password.text) {
                            return "make sure password is correct";
                          }
                          return null;
                        },
                        controller: re_password,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            hintText: 'set your password',
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
                              signUp();
                            }
                          },
                          child: const Text(
                            'Register',
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
                            'You have an account?',
                            style: TextStyle(
                                color: ColorsField.headingColor, fontSize: 11),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const login_View()));
                                debugPrint('Pressed');
                              },
                              icon: Icon(
                                Icons.app_registration,
                                color: Colors.green.shade900,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  void signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      navigate();
    } catch (error) {
      debugPrint('There is some error in you sign Up account \t\t$error');
    }
  }

  void navigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const login_View()));
    email.text = "";
    password.text = "";
  }
}
