import 'package:auto_size_text/auto_size_text.dart';
import 'package:eduapp/Google-services/firebase-services.dart';
import 'package:eduapp/Screens/DownloadPage.dart';
import 'package:eduapp/Screens/ProfilePage.dart';
import 'package:eduapp/Screens/loginScreen.dart';
import 'package:eduapp/subject_Pages/MathsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudentPageEsign extends StatefulWidget {
  const StudentPageEsign({Key? key}) : super(key: key);

  @override
  State<StudentPageEsign> createState() => _StudentPageEsignState();
}

// ignore: camel_case_types

class _StudentPageEsignState extends State<StudentPageEsign> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List Subjects = ['MATHEMATICS', 'PHYSICS', 'CHEMISTRY', 'LIFE SCIENCE'];
    List Sub_photo = ['maths', 'physics', 'chemistry', 'life'];
    List Courses = [15, 17, 20, 13];
    List indexHelper = [0, 1, 2, 3];
    List SubjectPages = [
      "MathsPage",
      "PhysicsPage",
      "ChemistryPage",
      "LifeSciPage"
    ];
    List SideBarContents = [
      "Home",
      "Upload Materials",
      "Download Notes",
      "Profile",
      "Logout"
    ];
    List<IconData> SideBarIcons = [
      Icons.home,
      Icons.upload_rounded,
      Icons.download_rounded,
      Icons.account_circle_rounded,
      Icons.logout
    ];
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 5,
        width: MediaQuery.of(context).size.width * 0.65,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 215, 5, 190),
                    Color.fromARGB(255, 35, 125, 250),
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
                      currentAccountPicture: const Icon(
                        Icons.account_circle,
                        size: 80,
                        color: Color.fromARGB(255, 240, 244, 248),
                      ),
                      accountName: Text(
                          "${FirebaseAuth.instance.currentUser!.displayName}"),
                      accountEmail:
                          Text("${FirebaseAuth.instance.currentUser!.email}"),
                    ))
                  ]),
            ),
            ListTile(
                leading: Icon(
                  SideBarIcons[0],
                  color: Colors.deepPurple,
                ),
                title: AutoSizeText(
                  "${SideBarContents[0]}",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/HomePage');
                }),
            ListTile(
                leading: Icon(
                  SideBarIcons[2],
                  color: Colors.deepPurple,
                ),
                title: AutoSizeText(
                  "${SideBarContents[2]}",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/Downloadpage');
                }),
            ListTile(
                leading: Icon(
                  SideBarIcons[3],
                  color: Colors.deepPurple,
                ),
                title: AutoSizeText(
                  "${SideBarContents[3]}",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/ProfilePage');
                }),
            ListTile(
                leading: Icon(
                  SideBarIcons[4],
                  color: Colors.deepPurple,
                ),
                title: AutoSizeText(
                  "${SideBarContents[4]}",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
                onTap: () async {
                  await FirebaseServices().signOut();
                  Navigator.pushReplacementNamed(context, '/');
                  Fluttertoast.showToast(msg: "LogOut Sucessful");
                })
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(236, 165, 252, 152),
              Color.fromARGB(245, 252, 223, 237),
              Color.fromARGB(245, 255, 176, 250),
            ],
          ),
        ),
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.005),
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 242, 3, 255),
                    Color.fromARGB(245, 29, 15, 179),
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
                            "${FirebaseAuth.instance.currentUser!.email}",
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
                            MediaQuery.of(context).size.width * 0.02),
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
                    vertical: MediaQuery.of(context).size.width * 0.04,
                  ),
                  child: const AutoSizeText(
                    "Explore",
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
                    maxLines: 1,
                    maxFontSize: 30.0,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.7),
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: indexHelper.length,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.015,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.025,
                                ),
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
                                                0.035),
                                        child: Image.asset(
                                            'assets/images/${Sub_photo[index]}.png'),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.016),
                                        child: AutoSizeText(
                                          "${Subjects[index]}",
                                          style: const TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: AutoSizeText(
                                        "${Courses[index]} Courses",
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                )),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, "/${SubjectPages[index]}");
                            });
                      }),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
