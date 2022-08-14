import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Screens/AddVideos.dart';
import '../models/youtubeModal.dart';

class MathsPage extends StatefulWidget {
  const MathsPage({Key? key, required String title}) : super(key: key);

  @override
  State<MathsPage> createState() => _MathsPageState();
}

class _MathsPageState extends State<MathsPage> {
  var url = "https://youtu.be/EDVJotmT584";
  // ignore: non_constant_identifier_names

  int i = 0;
  final Random _random = Random();
  late final YoutubePlayerController _youtubePlayerController =
      YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(url)!,
          flags: const YoutubePlayerFlags(
              autoPlay: false, mute: false, loop: false));

  @override
  void iniState() {
    super.initState();
  }

  @override
  void deactivate() {
    _youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        builder: (context, player) => Scaffold(
            appBar: AppBar(
              title: const Text(
                "Mathematics",
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 232, 40, 36),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AddVideos(SubjectName: "Maths")));
              },
              label: const AutoSizeText(
                "Add Videos",
                style: TextStyle(fontSize: 18),
                maxLines: 1,
              ),
              elevation: 5,
              extendedPadding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
              icon: const Icon(Icons.add),
              backgroundColor: Colors.red,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: SingleChildScrollView(
              child: Column(children: [
                player,
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.03,
                      horizontal: MediaQuery.of(context).size.width * 0.01),
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.02,
                      horizontal: MediaQuery.of(context).size.width * 0.01),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.yellow.shade200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Laplace Transformations",
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Dr.Gajendra Purohit ",
                          style: TextStyle(
                            fontSize: 19.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "6,58,148 Views",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.01),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Row(children: const <Widget>[
                                Icon(
                                  Icons.star,
                                  size: 25.0,
                                  color: Colors.deepPurpleAccent,
                                ),
                                Text(
                                  "4.8",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Row(children: const <Widget>[
                                Icon(
                                  Icons.timer,
                                  size: 25.0,
                                  color: Colors.deepPurpleAccent,
                                ),
                                Text(
                                  "72 hours",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: double.maxFinite,
                  child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      body: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          // borderRadius: BorderRadius.circular(25.0)),
                        ),
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
                                StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('Courses_link-Maths')
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                      }
                                      return ListView(
                                        physics: ScrollPhysics(),
                                        children:
                                            snapshot.data!.docs.map((document) {
                                          return Center(
                                              child: GestureDetector(
                                            onTap: () {
                                              String? url = document['link'];
                                              print(url);
                                              _youtubePlayerController.load(
                                                  YoutubePlayer.convertUrlToId(
                                                      url!)!);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors
                                                      .deepOrange.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              margin: EdgeInsets.symmetric(
                                                  vertical:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.015,
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.05,
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02),
                                              child: ClipRRect(
                                                child: Row(children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.symmetric(
                                                        horizontal:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.02),
                                                    child: const Icon(
                                                      Icons
                                                          .play_circle_fill_rounded,
                                                      size: 40.0,
                                                      color: Colors
                                                          .deepPurpleAccent,
                                                    ),
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      AutoSizeText(
                                                        document['title'],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        maxLines: 2,
                                                      ),
                                                      AutoSizeText(
                                                        "${_random.nextInt(10) + 1} Courses :${_random.nextInt(10) + 1} Lectures ",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          fontSize: 17.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                              ),
                                            ),
                                          ));
                                        }).toList(),
                                      );
                                    }),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.03),
                                  child: Column(children: [
                                    const Text(
                                        "The Laplace Transform, Elementary properties of Laplace transform, Laplace transform of derivatives and integrals, Laplace transform of unit step function and Impulse functions, Initial value theorem and Final value theorem"),
                                    Row(),
                                    const Text(""),
                                    Row(),
                                    const Text(
                                        "Definition of Fourier Series, Odd and Even Functions, Complex Fourier series, Half range series, Properties of Fourier Series, Parseval Identity")
                                  ]),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            )),
        player: YoutubePlayer(controller: _youtubePlayerController),
      );
}
