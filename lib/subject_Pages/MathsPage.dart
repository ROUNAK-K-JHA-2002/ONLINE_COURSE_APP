// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MathsPage extends StatefulWidget {
  const MathsPage({Key? key}) : super(key: key);

  @override
  State<MathsPage> createState() => _MathsPageState();
}

class _MathsPageState extends State<MathsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mathematics",
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        // color: Color.fromARGB(255, 247, 209, 255),
        child: Column(
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
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.amber.shade100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.03,
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Laplace Transformation with Fourier series",
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
                                "4.8",
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
                                "72 hours",
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
                  color: Colors.pink.shade50,
                ),
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
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
                          color: const Color.fromARGB(255, 83, 14, 243),
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
                              "Introduction To Laplace Theoram",
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
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02),
                          child: const Icon(
                            Icons.check_circle_rounded,
                            size: 35.0,
                            color: Color.fromARGB(255, 44, 243, 30),
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
                              "Introduction To Fourier Series",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "1.5 hours : 2 Lectures",
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
      ),
    );
  }
}
