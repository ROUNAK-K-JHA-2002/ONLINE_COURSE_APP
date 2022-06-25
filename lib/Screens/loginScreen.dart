// ignore: file_names
import 'package:eduapp/Google-services/firebase-services.dart';
import 'package:eduapp/RoleBasedForm/AdminForm.dart';
import 'package:eduapp/Screens/HomePage.dart';
import 'package:eduapp/Screens/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Sign_Up_Screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../RoleBasedForm/AdminForm.dart';
import '../RoleBasedForm/StudentForm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //emailField

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(235, 86, 61, 248),
              Color.fromARGB(255, 226, 3, 255),
            ],
          ),
        ),
        child: Column(children: <Widget>[
          Expanded(
              flex: 2,
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.7,
                child: Image.asset('assets/images/login_logo.png'),
              )),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.03),
            child: const Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                decoration: TextDecoration.none,
                color: Color.fromARGB(255, 245, 243, 243),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromARGB(255, 251, 249, 249),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        10.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                      body: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.015),
                            decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: TabBar(
                              indicator: BoxDecoration(
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(15.0)),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: const [
                                Tab(
                                  text: 'Students',
                                ),
                                Tab(
                                  text: 'Teachers',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                            child: TabBarView(
                          children: [
                            SingleChildScrollView(child: StudentForm()),
                            SingleChildScrollView(child: AdminForm()),
                          ],
                        ))
                      ],
                    ),
                  )),
                ),
              )),
        ]),
      ),
    );
  }
}
