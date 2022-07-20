// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:path/path.dart' as Path;
import 'package:eduapp/FirebaseApi/firebaseApi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  UploadTask? task;
  File? file;

  @override
  // ignore: duplicate_ignore
  Widget build(BuildContext context) {
    final fileName =
        file != null ? Path.basename(file!.path) : 'No File Selected';

    // ignore: non_constant_identifier_names
    List Subjects = ["Maths", "Chemistry", "Physics", "Life_Science"];
    List Colours = [
      Colors.yellow,
      Colors.orange,
      Colors.blueAccent,
      Colors.red
    ];
    List ImageLinks = ["Maths.jpg", "Chemistry.jpg", "physics.jpg", "cell.jpg"];

    return Scaffold(
        body: Column(
      children: [
        Container(
            color: Color.fromARGB(255, 153, 43, 250),
            width: MediaQuery.of(context).size.width * 1,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.15,
                bottom: MediaQuery.of(context).size.width * 0.04),
            child: const Center(
              child: AutoSizeText(
                "Upload Materials",
                style: TextStyle(fontSize: 25.0, color: Colors.white),
                maxLines: 1,
              ),
            )),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(236, 248, 237, 163),
                  Color.fromARGB(245, 219, 119, 252),
                  Color.fromARGB(245, 248, 127, 103),
                ],
              ),
            ),
            child: ListView.builder(
              itemCount: Subjects.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ExpandableNotifier(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Color.fromARGB(255, 12, 217, 240),
                        width: 0.5,
                        style: BorderStyle.solid),
                    color: Colours[index],
                  ),
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  child: Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Color.fromARGB(255, 26, 21, 21),
                              width: 0.5,
                              style: BorderStyle.solid),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/${ImageLinks[index]}'))),
                    ),
                    ScrollOnExpand(
                        child: ExpandablePanel(
                            header: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Upload ${Subjects[index]} Notes",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            expanded: Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Material(
                                    elevation: 5,
                                    color:
                                        const Color.fromARGB(255, 83, 14, 243),
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      child: const Text(
                                        "Select File",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                      onPressed: () => selectFile(),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    fileName,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 15),
                                  Material(
                                    elevation: 5,
                                    color:
                                        const Color.fromARGB(255, 83, 14, 243),
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      child: const Text(
                                        "Upload File",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),
                                      onPressed: () => uploadFile(index),
                                    ),
                                  ),
                                  task != null
                                      ? buildUploadStatus(task!)
                                      : Container(),
                                ],
                              ),
                            ),
                            collapsed: const Text("",
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.black)),
                            builder: (_, collapsed, expanded) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Expandable(
                                  collapsed: collapsed,
                                  expanded: expanded,
                                  theme: const ExpandableThemeData(
                                      crossFadePoint: 0),
                                ),
                              );
                            }))
                  ]),
                ));
              },
            ),
          ),
        )
      ],
    ));
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile(index) async {
    List Subjects = ["Maths", "Chemistry", "Physics", "Life_Science"];
    if (file == null) return;

    final fileName = Path.basename(file!.path);
    final destination = '${Subjects[index]}/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Alert!"),
          content: const Text("File Uploaded Succefully."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const UploadPage())));
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                child: const Text("Done"),
              ),
            ),
          ],
        ),
      );
    });
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
