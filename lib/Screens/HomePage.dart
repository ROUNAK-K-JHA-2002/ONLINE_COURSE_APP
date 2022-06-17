import 'package:eduapp/Google-services/firebase-services.dart';
import 'package:eduapp/Screens/loginScreen.dart';
import 'package:eduapp/subject_Pages/MathsPage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../modals/User_Modal.dart';
import '../subject_Pages/physicsPage.dart';
import '../subject_Pages/MathsPage.dart';
import '../subject_Pages/ChemistryPage.dart';
import '../subject_Pages/LifeSciPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// ignore: camel_case_types
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(104, 254, 192, 249),
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.005),
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 170, 0, 255),
                    Color.fromARGB(245, 23, 2, 255),
                  ],
                ),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(94, 5, 5, 5),
                      blurRadius: 5,
                      spreadRadius: 5,
                      offset: Offset(4, 4)),
                ]),
            child: Stack(
              alignment: const Alignment(1.0, 0.5),
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.15),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.02,
                          horizontal: MediaQuery.of(context).size.width * 0.08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hello,",
                            style:
                                TextStyle(color: Colors.white, fontSize: 35.0),
                          ),
                          Text(
                            "Good Evening",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                        ],
                      ),
                    )),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(0, 1, 1, 1),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(73, 92, 91, 91),
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  offset: Offset(1, 2)),
                            ]),
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.01),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.18,
                            right: MediaQuery.of(context).size.width * 0.03),
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: const Icon(
                          Icons.logout_rounded,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                      onTap: () async {
                        await FirebaseServices().signOut();
                        Navigator.pushNamed(context, '/');
                        Fluttertoast.showToast(msg: "LogOut Sucessful");
                      },
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(14.0)),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.1,
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width * 0.0195),
                            child: const Icon(
                              Icons.search,
                              color: Colors.deepPurple,
                              size: 33.0,
                            ),
                          )),
                      const Expanded(
                          flex: 3,
                          child: TextField(
                            cursorColor: Color.fromARGB(213, 101, 30, 255),
                            decoration: InputDecoration(
                                fillColor: Color.fromARGB(255, 255, 252, 252),
                                filled: true,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                hintText: 'Search ...',
                                hintStyle: TextStyle(color: Colors.deepPurple)),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width * 0.0195),
                            child: const Icon(
                              Icons.mic,
                              color: Colors.deepPurple,
                              size: 33.0,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.05),
                  child: const Text(
                    "Explore",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: ListView(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.28,
                                  margin: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.03),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(94, 38, 35, 35),
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                          offset: Offset(4, 4)),
                                    ],
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                          child: Image.asset(
                                              'assets/images/maths.png'),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02),
                                          child: const Text(
                                            "MATHEMATICS",
                                            style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      const Expanded(
                                        flex: 1,
                                        child: Text(
                                          "20 Courses",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ],
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MathsPage()));
                              },
                            ),
                          ),
                          Expanded(
                              child: InkWell(
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.28,
                                margin: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.03),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(94, 38, 35, 35),
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: Offset(4, 4)),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                        child: Image.asset(
                                            'assets/images/physics.png'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        child: const Text(
                                          "PHYSICS",
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        "20 Courses",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                )),
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PhysicsPage()));
                            }),
                          ))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: InkWell(
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.28,
                                margin: EdgeInsets.all(
                                    MediaQuery.of(context).size.width * 0.03),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(94, 38, 35, 35),
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: Offset(4, 4)),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                        child: Image.asset(
                                            'assets/images/chemistry.png'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        child: const Text(
                                          "CHEMISTRY",
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        "20 Courses",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ChemistryPage()));
                            },
                          )),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.28,
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.03),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(94, 38, 35, 35),
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: Offset(4, 4)),
                                ],
                              ),
                              child: InkWell(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                        child: Image.asset(
                                            'assets/images/life.png'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        child: const Text(
                                          "LIFE SCIENCE",
                                          style: TextStyle(
                                              fontSize: 23.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Text(
                                        "20 Courses",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LifeSciencePage()));
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ])),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
