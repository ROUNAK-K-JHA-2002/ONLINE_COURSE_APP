import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Screens/AddVideos.dart';

class PhysicsPage extends StatefulWidget {
  const PhysicsPage({Key? key, required String title}) : super(key: key);

  @override
  State<PhysicsPage> createState() => _PhysicsPageState();
}

class _PhysicsPageState extends State<PhysicsPage> {
  int i = 0;
  final Random _random = Random();
  var url = "https://youtu.be/zNx3KLSr2jM";
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
                "Physics",
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 255, 170, 12),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AddVideos(SubjectName: "Physics")));
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
              backgroundColor: const Color.fromARGB(255, 255, 170, 12),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(235, 217, 249, 193),
                    Color.fromARGB(245, 248, 233, 188),
                    Color.fromARGB(245, 190, 228, 253),
                  ],
                ),
              ),
              child: SingleChildScrollView(
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
                        color: const Color.fromARGB(255, 252, 202, 38)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.width * 0.01,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Quantum Mechanics",
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.width * 0.01,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Dextro - Physics",
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.width * 0.01,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            " ${_random.nextInt(99999) + 500} Views",
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.width * 0.01),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.02),
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
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                child: Row(children: <Widget>[
                                  const Icon(
                                    Icons.timer,
                                    size: 25.0,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  Text(
                                    "${_random.nextInt(80) + 10} hours",
                                    style: const TextStyle(
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
                              vertical:
                                  MediaQuery.of(context).size.width * 0.02),
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
                                  StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('Courses_link-Physics')
                                          .snapshots(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<QuerySnapshot>
                                              snapshot) {
                                        if (!snapshot.hasData) {
                                          return const Center(
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        }
                                        return ListView(
                                          physics: const ScrollPhysics(),
                                          children: snapshot.data!.docs
                                              .map((document) {
                                            return Center(
                                                child: GestureDetector(
                                              onTap: () {
                                                String? url = document['link'];
                                                print(url);
                                                _youtubePlayerController.load(
                                                    YoutubePlayer
                                                        .convertUrlToId(url!)!);
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
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          maxLines: 3,
                                                        ),
                                                        AutoSizeText(
                                                          "${_random.nextInt(10) + 1} Courses :${_random.nextInt(10) + 1} Lectures ",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
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
                                        MediaQuery.of(context).size.width *
                                            0.03),
                                    child: Column(children: [
                                      const Text(
                                          "Quantum physics is the study of matter and energy at the most fundamental level. It aims to uncover the properties and behaviors of the very building blocks of nature."),
                                      Row(),
                                      const Text(""),
                                      Row(),
                                      const Text(
                                          " Quantum discoveries have been incorporated into our foundational understanding of materials, chemistry, biology, and astronomy. These discoveries are a valuable resource for innovation, giving rise to devices such as lasers and transistors, and enabling real progress on technologies once considered purely speculative, such as quantum computers.")
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
              ),
            )),
        player: YoutubePlayer(controller: _youtubePlayerController),
      );
}
