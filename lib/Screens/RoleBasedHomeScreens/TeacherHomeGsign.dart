// ignore_for_file: unnecessary_const

import 'package:auto_size_text/auto_size_text.dart';
import 'package:eduapp/Google-services/firebase-services.dart';
import 'package:eduapp/Screens/ProfilePage.dart';
import 'package:eduapp/Screens/UploadComponents.dart';
import 'package:eduapp/Screens/UploadsPage.dart';
import 'package:eduapp/Screens/loginScreen.dart';
import 'package:eduapp/subject_Pages/MathsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../subject_Pages/ChemistryPage.dart';
import '../../subject_Pages/LifeSciPage.dart';
import '../../subject_Pages/MathsPage.dart';
import '../../subject_Pages/PhysicsPage.dart';

class AdminPageGsign extends StatefulWidget {
  const AdminPageGsign({Key? key}) : super(key: key);

  @override
  State<AdminPageGsign> createState() => _AdminPageGsignState();
}

// ignore: camel_case_types
class _AdminPageGsignState extends State<AdminPageGsign> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 5,
        width: MediaQuery.of(context).size.width * 0.65,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(235, 220, 1, 232),
                    Color.fromARGB(255, 5, 117, 252),
                  ],
                ),
              ),
              padding: EdgeInsets.zero,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: UserAccountsDrawerHeader(
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      currentAccountPicture: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.1,
                        backgroundImage: NetworkImage(
                            FirebaseAuth.instance.currentUser!.photoURL!),
                      ),
                      accountName: Text(
                          "${FirebaseAuth.instance.currentUser!.displayName}"),
                      accountEmail:
                          Text("${FirebaseAuth.instance.currentUser!.email}"),
                    ))
                  ]),
            ),
            const ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
            ),
            ListTile(
              leading: const Icon(Icons.upload_rounded),
              title: const Text("Upload Materials"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const UploadPage())));
              },
            ),
            const ListTile(
              leading: const Icon(Icons.download_rounded),
              title: Text("Download Notes"),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ProfilePage())));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () async {
                await FirebaseServices().signOut();
                Navigator.pushNamed(context, '/');
                Fluttertoast.showToast(msg: "LogOut Sucessful");
              },
            ),
            const ListTile(
              leading: const Icon(Icons.question_mark_rounded),
              title: Text("About App"),
            ),
          ],
        ),
      ),
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
                        children: [
                          const Text(
                            "Hello,",
                            style:
                                TextStyle(color: Colors.white, fontSize: 35.0),
                          ),
                          Text(
                            "${FirebaseAuth.instance.currentUser!.displayName}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25.0),
                          ),
                        ],
                      ),
                    )),
                    InkWell(
                      child: Container(
                        //
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.01),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.18,
                            right: MediaQuery.of(context).size.width * 0.03),
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 35.0,
                        ),
                      ),
                      // onTap: () async {
                      //   await FirebaseServices().signOut();
                      //   Navigator.pushNamed(context, '/');
                      //   Fluttertoast.showToast(msg: "LogOut Sucessful");
                      // },
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.1,
                      left: MediaQuery.of(context).size.width * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        cursorColor: const Color.fromARGB(213, 101, 30, 255),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search_rounded),
                            suffixIcon: const Icon(Icons.mic),
                            fillColor: const Color.fromARGB(255, 255, 252, 252),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            hintText: 'Search ...',
                            hintStyle:
                                const TextStyle(color: Colors.deepPurple)),
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
                  child: const AutoSizeText(
                    "Explore",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
                    maxLines: 1,
                    maxFontSize: 30.0,
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
                                        builder: (context) => const MathsPage(
                                              title: 'Mathematics',
                                            )));
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
                                      builder: (context) => const PhysicsPage(
                                            title: "Physics",
                                          )));
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
                                      builder: (context) => const ChemistryPage(
                                            title: "Chemistry",
                                          )));
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
                                              const LifeSciencePage(
                                                title: "Life Science",
                                              )));
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
