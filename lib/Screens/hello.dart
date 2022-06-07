import 'package:flutter/material.dart';
import '../modals/User_Modal.dart';

class testing extends StatefulWidget {
  const testing({Key? key}) : super(key: key);

  @override
  State<testing> createState() => _testingState();
}

// ignore: camel_case_types
class _testingState extends State<testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(104, 254, 192, 249),
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
                    Container(
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
                        Icons.notifications,
                        color: Colors.white,
                        size: 40.0,
                      ),
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
                  child: const TextField(
                    cursorColor: Color.fromARGB(213, 101, 30, 255),
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 255, 252, 252),
                        filled: true,
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                        hintText: 'Search ...',
                        hintStyle: TextStyle(color: Colors.deepPurple)),
                  ),
                  width: MediaQuery.of(context).size.width * 1,
                ),
                const Positioned(
                  // right: ,
                  left: 48,
                  top: 195,
                  child: Icon(
                    Icons.search,
                    color: Colors.deepPurple,
                    size: 33.0,
                  ),
                ),
                const Positioned(
                  // right: ,
                  right: 50,
                  top: 195,
                  child: Icon(
                    Icons.mic,
                    color: Colors.deepPurple,
                    size: 33.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: const Text(
                      "Explore",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                    child: Row(
                  children: <Widget>[
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
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.04),
                                  child: Image.asset('assets/images/maths.png'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
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
                    ),
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
                                        vertical:
                                            MediaQuery.of(context).size.height *
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
                            )))
                  ],
                )),
                Expanded(
                    child: Row(
                  children: <Widget>[
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
                                        vertical:
                                            MediaQuery.of(context).size.height *
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
                            ))),
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
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.04),
                                    child:
                                        Image.asset('assets/images/life.png'),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical:
                                            MediaQuery.of(context).size.height *
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
                            ))),
                  ],
                )),
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 20,
          selectedIconTheme:
              const IconThemeData(color: Colors.deepPurple, size: 20),
          selectedItemColor: Colors.deepPurple,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.deepOrangeAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                color: Colors.deepPurple,
              ),
              label: 'Featured',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_fill_rounded,
                color: Colors.deepPurple,
              ),
              label: 'Learning',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.heart_broken_rounded,
                color: Colors.deepPurple,
              ),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.deepPurple,
              ),
              label: 'Settings',
            ),
          ]),
    );
  }
}
