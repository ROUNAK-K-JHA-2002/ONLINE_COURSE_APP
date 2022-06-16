// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MathsPage extends StatefulWidget {
  const MathsPage({Key? key}) : super(key: key);

  @override
  State<MathsPage> createState() => _MathsPageState();
}

class _MathsPageState extends State<MathsPage> {
  @override
  Widget build(BuildContext context) {
    String? videoID =
        YoutubePlayer.convertUrlToId('https://youtu.be/vNCD7t3WuVs');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mathematics",
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: 'videoID', //Add videoID.
                    flags: const YoutubePlayerFlags(
                      hideControls: false,
                      controlsVisibleAtStart: true,
                      autoPlay: false,
                      mute: false,
                    ),
                  ),
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.black,
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
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
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              child: Column(children: <Widget>[
                Expanded(
                  child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        body: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical:
                                  MediaQuery.of(context).size.width * 0.03),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(25.0)),
                          child: Column(
                            children: [
                              Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width *
                                          0.015),
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent,
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: TabBar(
                                    indicator: BoxDecoration(
                                        color: Colors.pinkAccent,
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    // labelColor: Colors.white,
                                    unselectedLabelColor: Colors.black,
                                    tabs: const [
                                      Tab(
                                        text: 'Playlist',
                                      ),
                                      Tab(
                                        text: 'Description',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: TabBarView(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025),
                                          padding: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                          child: Row(children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              child: const Icon(
                                                Icons.play_circle_fill_rounded,
                                                size: 40.0,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                            ),
                                            Column(
                                              children: const <Widget>[
                                                Text(
                                                  "Biotechnology",
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
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.32),
                                              child: const Icon(
                                                Icons.check_circle_rounded,
                                                size: 35.0,
                                                color: Color.fromARGB(
                                                    255, 90, 193, 12),
                                              ),
                                            )
                                          ]),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025),
                                          padding: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                          child: Row(children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              child: const Icon(
                                                Icons.play_circle_fill_rounded,
                                                size: 40.0,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                            ),
                                            Column(
                                              children: const <Widget>[
                                                Text(
                                                  "Biotechnology",
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
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.32),
                                              child: const Icon(
                                                Icons.check_circle_rounded,
                                                size: 35.0,
                                                color: Color.fromARGB(
                                                    255, 90, 193, 12),
                                              ),
                                            )
                                          ]),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025),
                                          padding: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                          child: Row(children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              child: const Icon(
                                                Icons.play_circle_fill_rounded,
                                                size: 40.0,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                            ),
                                            Column(
                                              children: const <Widget>[
                                                Text(
                                                  "Biotechnology",
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
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.32),
                                              child: const Icon(
                                                Icons.check_circle_rounded,
                                                size: 35.0,
                                                color: Color.fromARGB(
                                                    255, 90, 193, 12),
                                              ),
                                            )
                                          ]),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025),
                                          padding: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                          child: Row(children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              child: const Icon(
                                                Icons.play_circle_fill_rounded,
                                                size: 40.0,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                            ),
                                            Column(
                                              children: const <Widget>[
                                                Text(
                                                  "Biotechnology",
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
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.32),
                                              child: const Icon(
                                                Icons.check_circle_rounded,
                                                size: 35.0,
                                                color: Color.fromARGB(
                                                    255, 90, 193, 12),
                                              ),
                                            )
                                          ]),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.025),
                                          padding: EdgeInsets.symmetric(
                                              vertical: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04),
                                          child: Row(children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              child: const Icon(
                                                Icons.play_circle_fill_rounded,
                                                size: 40.0,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                            ),
                                            Column(
                                              children: const <Widget>[
                                                Text(
                                                  "Biotechnology",
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
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.32),
                                              child: const Icon(
                                                Icons.check_circle_rounded,
                                                size: 35.0,
                                                color: Color.fromARGB(
                                                    255, 90, 193, 12),
                                              ),
                                            )
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(children: [
                                      Text(
                                          "The Laplace Transform, Elementary properties of Laplace transform, Laplace transform of derivatives and integrals, Laplace transform of unit step function and Impulse functions, Initial value theorem and Final value theorem"),
                                      Row(),
                                      Text(
                                          "Definition of Fourier Series, Odd and Even Functions, Complex Fourier series, Half range series, Properties of Fourier Series, Parseval Identity")
                                    ]),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      )),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
