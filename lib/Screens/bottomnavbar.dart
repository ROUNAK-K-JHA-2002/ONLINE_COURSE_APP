import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eduapp/Screens/test.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<dynamic> _page = [
    TestPage(),
    Add1(),
    Copyright(),
    HomePage(),
  ];
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    print("This is the actice page $_activePage");
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _activePage,
          height: 60.0,
          items: const <Widget>[
            Icon(
              Icons.biotech_rounded,
              size: 30,
              color: Colors.deepPurpleAccent,
            ),
            Icon(
              Icons.science_rounded,
              size: 30,
              color: Colors.deepPurpleAccent,
            ),
            Icon(
              Icons.calculate_rounded,
              size: 30,
              color: Colors.deepPurpleAccent,
            ),
            Icon(
              Icons.park_rounded,
              size: 30,
              color: Colors.deepPurpleAccent,
            ),
          ],
          color: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              _activePage = index;
            });
            print("Index : $index active : $_activePage");
            // you don't need this as the bottom nav is doing it for you just have to specify index
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => _page[_activePage]));
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _page[_activePage],
          ),
        ));
  }
}

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: const Text("Add Page"),
      ),
    );
  }
}

class Add1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: const Text("Add Page"),
      ),
    );
  }
}

class Copyright extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: const Text("Copy Right Page"),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: const Text("Home Page"),
      ),
    );
  }
}
