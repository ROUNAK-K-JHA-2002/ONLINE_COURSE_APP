// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhysicsPage extends StatefulWidget {
  const PhysicsPage({Key? key}) : super(key: key);

  @override
  State<PhysicsPage> createState() => _PhysicsPageState();
}

class _PhysicsPageState extends State<PhysicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Physics",
        ),
        backgroundColor: Color.fromARGB(255, 241, 119, 245),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.deepOrange.shade100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.03,
                        horizontal: MediaQuery.of(context).size.width * 0.03),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Quantum Mechanics",
                      style: TextStyle(
                        fontSize: 23.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.03),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Created by Rounak Kumar Jha",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02),
                          child: Row(children: const <Widget>[
                            Icon(
                              Icons.star_border_outlined,
                              size: 25.0,
                            ),
                            Text(
                              "4.4",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02),
                          child: Row(children: const <Widget>[
                            Icon(
                              Icons.timer_outlined,
                              size: 25.0,
                            ),
                            Text(
                              "172 hours",
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color.fromARGB(255, 194, 209, 251),
              ),
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.04,
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: ListView(children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color.fromARGB(255, 67, 150, 244),
                        child: MaterialButton(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          onPressed: (() {}),
                          child: const Text("Playlist"),
                        ),
                      )),
                      Expanded(
                          child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromARGB(255, 242, 241, 245),
                        child: MaterialButton(
                          onPressed: (() {}),
                          child: const Text("Description"),
                        ),
                      ))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.025),
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.04),
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02),
                        child: const Icon(
                          Icons.play_circle_fill_rounded,
                          size: 40.0,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      Column(
                        children: const <Widget>[
                          Text(
                            "Quantum Mechanics",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "5 hours : 1 Lectures",
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.25),
                        child: const Icon(
                          Icons.check_circle_rounded,
                          size: 35.0,
                          color: Color.fromARGB(255, 90, 193, 12),
                        ),
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.025),
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.04),
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02),
                        child: const Icon(
                          Icons.play_circle_fill_rounded,
                          size: 40.0,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      Column(
                        children: const <Widget>[
                          Text(
                            "Relativity and Bohrs Model",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "2.5 hours : 2 Lectures",
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.09),
                        child: const Icon(
                          Icons.lock_clock_rounded,
                          size: 35.0,
                          color: Colors.amber,
                        ),
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.025),
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.04),
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02),
                        child: const Icon(
                          Icons.play_circle_fill_rounded,
                          size: 40.0,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      Column(
                        children: const <Widget>[
                          Text(
                            "Need of Intersecting LT & FT",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "3 hours : 4 Lectures",
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.11),
                        child: const Icon(
                          Icons.lock_clock_rounded,
                          size: 35.0,
                          color: Colors.amber,
                        ),
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.025),
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.04),
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02),
                        child: const Icon(
                          Icons.play_circle_fill_rounded,
                          size: 40.0,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      Column(
                        children: const <Widget>[
                          Text(
                            "Laplace Transformation",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "3 hours : 6 Lectures",
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.19),
                        child: const Icon(
                          Icons.lock_clock_rounded,
                          size: 35.0,
                          color: Colors.amber,
                        ),
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.025),
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.04),
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02),
                        child: const Icon(
                          Icons.play_circle_fill_rounded,
                          size: 40.0,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      Column(
                        children: const <Widget>[
                          Text(
                            "Fourier Transform",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "2 hours : 4 Lectures",
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.31),
                        child: const Icon(
                          Icons.lock_clock_rounded,
                          size: 35.0,
                          color: Colors.amber,
                        ),
                      )
                    ]),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
