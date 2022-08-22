// ignore: file_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:eduapp/RoleBasedForm/AdminForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../RoleBasedForm/AdminForm.dart';
import '../RoleBasedForm/StudentForm.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key, required String title}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> with SingleTickerProviderStateMixin {
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
          // Expanded(
          //     flex: 2,
          //     child: SizedBox(
          //       height: MediaQuery.of(context).size.width * 0.7,
          //       child: Image.asset('assets/images/login_logo.png'),
          //     )),

          Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.08),
                child: PageView(
                  children: [
                    Center(
                      child: Column(children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          child: Image.asset('assets/images/login_logo.png'),
                        ),
                        const AutoSizeText(
                          "Welcome To EduApp",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 3, 255, 221),
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.08),
                          child: const AutoSizeText(
                            "A comprehensive app for e-learning designed for learning purpose.Now Study at Your own pace and intersets.",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 4,
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              AutoSizeText(
                                "Know More ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 238, 255, 3),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color.fromARGB(255, 238, 255, 3),
                              )
                            ]),
                      ]),
                    ),
                    Center(
                      child: Column(children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          child: Image.asset('assets/images/features.png'),
                        ),
                        const AutoSizeText(
                          "Features",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 3, 255, 221),
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.08),
                          child: const AutoSizeText(
                            "Major Features of the app includes -- Subject-Wise Learning , Teachers can Upload Content , Students can download it.",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 4,
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              AutoSizeText(
                                " Next ",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 238, 255, 3),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color.fromARGB(255, 238, 255, 3),
                              )
                            ]),
                      ]),
                    ),
                    Center(
                      child: Column(children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          child: Image.asset('assets/images/growth.png'),
                        ),
                        const AutoSizeText(
                          "Growth",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 3, 255, 221),
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.08),
                          child: const AutoSizeText(
                            "Indivual Doubt Solving, One to One Interactions , Personal Assistance , and Overall Well being",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 4,
                          ),
                        ),
                        const AutoSizeText(
                          "Login To Explore ",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 238, 255, 3),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_downward_rounded,
                          color: Color.fromARGB(255, 238, 255, 3),
                        )
                      ]),
                    ),
                  ],
                  physics: const BouncingScrollPhysics(),
                ),
              )),

          Expanded(
              flex: 2,
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
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
