import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            color: Color.fromARGB(255, 239, 76, 144),
            width: MediaQuery.of(context).size.width * 1,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.1,
                bottom: MediaQuery.of(context).size.width * 0.03),
            child: const Center(
              child: AutoSizeText(
                "Download Materials",
                style: TextStyle(fontSize: 25.0, color: Colors.white),
                maxLines: 1,
              ),
            )),
        Expanded(
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
                body: Container(
              color: const Color.fromARGB(255, 252, 223, 246),
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
                          color: const Color.fromARGB(255, 3, 83, 255),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: TabBar(
                        indicator: BoxDecoration(
                            color: const Color.fromARGB(255, 7, 209, 254),
                            borderRadius: BorderRadius.circular(15.0)),
                        labelColor: const Color.fromARGB(255, 6, 5, 5),
                        unselectedLabelColor:
                            const Color.fromARGB(255, 255, 253, 253),
                        tabs: const [
                          Tab(
                            text: 'Maths',
                          ),
                          Tab(
                            text: 'Physics',
                          ),
                          Tab(
                            text: 'Chemistry',
                          ),
                          Tab(
                            text: 'Life_Science',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                      child: TabBarView(
                    children: [
                      Download("Maths"),
                      Download("Physics"),
                      Download("Chemistry"),
                      Download("Life_Science"),
                    ],
                  ))
                ],
              ),
            )),
          ),
        )
      ],
    ));
  }
}

class Download extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String SubjectName;
  // ignore: use_key_in_widget_constructors
  const Download(this.SubjectName);

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  late Future<ListResult> fututeFiles;
  Map<int, double> downloadProgress = {};
  void getPermission() async {
    print("getPermission");
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();
    print(statuses[Permission.storage]);
  }

  @override
  void initState() {
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: const Color.fromARGB(255, 251, 249, 249),
            style: BorderStyle.solid,
            width: 1.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(238, 170, 225, 250),
            Color.fromARGB(245, 253, 155, 204),
            Color.fromARGB(245, 159, 141, 250),
          ],
        ),
      ),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: Column(children: [
        Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.03),
          child: AutoSizeText(
            "${widget.SubjectName} Materials",
            style: const TextStyle(
                fontSize: 30.0, color: Color.fromARGB(255, 8, 33, 253)),
            maxLines: 1,
          ),
        ),
        Expanded(
            child: FutureBuilder<ListResult>(
          future:
              FirebaseStorage.instance.ref('/${widget.SubjectName}').listAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final files = snapshot.data!.items;
              return ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    final file = files[index];
                    double? progress = downloadProgress[index];
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading: const Icon(
                          Icons.file_copy,
                          color: Color.fromARGB(255, 7, 7, 255),
                        ),
                        title: AutoSizeText(
                          file.name,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 37, 0, 186)),
                        ),
                        subtitle: progress != null
                            ? LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.black,
                              )
                            : null,
                        trailing: const Icon(
                          Icons.download,
                          color: Colors.black,
                        ),
                        onTap: () {
                          downloadfile(index, file);
                          Fluttertoast.showToast(msg: "Downloading File ...");
                        },
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Center(
                child: AutoSizeText("Error in Fetching files"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 1, 22, 252),
                ),
              );
            }
          },
        ))
      ]),
    );
  }

  Future downloadfile(index, Reference ref) async {
    if (await Permission.storage.isGranted) {
      final url = await ref.getDownloadURL();
      //Only visible to App Not User
      print(url);
      print("object");
      final dir = await getApplicationDocumentsDirectory();
      final file = File("/storage/emulated/0/Download/${ref.name}");
      //Visible to User
      final tempdir = await getTemporaryDirectory();
      final path = '${tempdir.path}/${ref.name}';
      print(path);
      await Dio().download(
        url,
        path,
        onReceiveProgress: (recieved, total) {
          double progress = recieved / total;
          setState(() {
            downloadProgress[index] = progress;
          });
        },
      );

      print("file");
      await ref.writeToFile(file);

      print(File(path));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Downloded to ${file.path}')));
    }
  }
}
