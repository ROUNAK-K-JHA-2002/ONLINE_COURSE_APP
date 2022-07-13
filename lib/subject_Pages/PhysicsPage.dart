import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../models/youtubeModal.dart';

class PhysicsPage extends StatefulWidget {
  const PhysicsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PhysicsPageState createState() => _PhysicsPageState();
}

class _PhysicsPageState extends State<PhysicsPage> {
  late YoutubePlayerController _ytbPlayerController;
  List<YoutubeModel> videosList = [
    const YoutubeModel(id: 1, youtubeId: 'KQC9V5RmctE'),
    const YoutubeModel(id: 2, youtubeId: 'dKGEIoZXg8A'),
    const YoutubeModel(id: 3, youtubeId: '2bk1qkImchw'),
    const YoutubeModel(id: 4, youtubeId: 'GNtsk93djUY'),
    const YoutubeModel(id: 5, youtubeId: 'hQ9dbUvrZvQ'),
  ];
  // ignore: non_constant_identifier_names
  List VideoTitle = [
    'Introduction To Quantum Physics',
    'De Broglie Idea of Wave Particle Duality',
    'Heisenberg Uncertainty Principle ',
    'Physical Signinficace of Wave Function',
    'Schrondinger Time Equations'
  ];
  // ignore: non_constant_identifier_names
  List CourseTime = [
    '2 hours : 4 lecture',
    '4 hours : 2 lecture',
    '3 hours : 7 lecture',
    '2 hours : 6 lecture',
    '5 hours : 1 lecture'
  ];
  @override
  void initState() {
    super.initState();

    _setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController = YoutubePlayerController(
          initialVideoId: videosList[0].youtubeId,
          params: const YoutubePlayerParams(
            showFullscreenButton: true,
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    _setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _ytbPlayerController.close();
  }

  _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Physics",
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SafeArea(
          child: Container(
        color: Colors.pink.shade100,
        child: Column(
          children: [
            _buildYtbView(),
            _buildMoreVideoTitle(),
            _buildMoreVideosView(),
          ],
        ),
      )),
    );
  }

  _buildYtbView() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      // ignore: unnecessary_null_comparison
      child: _ytbPlayerController != null
          ? YoutubePlayerIFrame(controller: _ytbPlayerController)
          : const Center(child: CircularProgressIndicator()),
    );
  }

  _buildMoreVideoTitle() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * 0.03,
          horizontal: MediaQuery.of(context).size.width * 0.01),
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * 0.02,
          horizontal: MediaQuery.of(context).size.width * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.amber.shade50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.03),
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
                vertical: MediaQuery.of(context).size.width * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.03),
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
                vertical: MediaQuery.of(context).size.width * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.03),
            alignment: Alignment.centerLeft,
            child: const Text(
              "72,148 Views",
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
                      horizontal: MediaQuery.of(context).size.width * 0.02),
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
                      horizontal: MediaQuery.of(context).size.width * 0.02),
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
    );
  }

  _buildMoreVideosView() {
    return Expanded(
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
                          borderRadius: BorderRadius.circular(15.0)),
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
                    Expanded(
                      child: ListView.builder(
                          itemCount: videosList.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                final _newCode = videosList[index].youtubeId;
                                _ytbPlayerController.load(_newCode);
                                _ytbPlayerController.stop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange.shade100,
                                    borderRadius: BorderRadius.circular(15)),
                                margin: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.width *
                                            0.015,
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                child: ClipRRect(
                                  child: Row(children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
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
                                      children: <Widget>[
                                        Text(
                                          "${VideoTitle[index]}",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "${CourseTime[index]}",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.03),
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
    );
  }
}
