import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(249, 207, 252, 1.0),
      child: ListView(
        children: <Widget>[
          Expanded(
              child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 124, 48, 240),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: <Widget>[
                const Expanded(
                    child: Text(
                  "Hello, Good Evening",
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 20),
                )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Image.asset('assets/images/hi.png'),
                ))
              ],
            ),
          )),
          Expanded(
            child: Container(
              child: const Text(
                "Explore",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w800),
              ),
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
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
                                    MediaQuery.of(context).size.height * 0.02),
                            child: const Text(
                              "MATHEMATICS",
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
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
                            child: Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.04),
                              child: Image.asset('assets/images/physics.png'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.02),
                              child: const Text(
                                "PHYSICS",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )))
            ],
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
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
                            child: Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.04),
                              child: Image.asset('assets/images/chemistry.png'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.02),
                              child: const Text(
                                "CHEMISTRY",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ))),
              Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
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
                            child: Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.04),
                              child: Image.asset('assets/images/life.png'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.02),
                              child: const Text(
                                "LIFE SCIENCE",
                                style: TextStyle(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ))),
            ],
          )),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: const Text(
                "See all",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
