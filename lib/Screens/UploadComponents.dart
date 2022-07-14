import 'dart:io';
import 'package:expandable/expandable.dart';
import 'package:path/path.dart' as Path;
import 'package:eduapp/FirebaseApi/firebaseApi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Upload Materials"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: const [MathsUpload(), ChemistryUpload()],
          )),
        ));
  }
}

class MathsUpload extends StatefulWidget {
  const MathsUpload({Key? key}) : super(key: key);

  @override
  State<MathsUpload> createState() => _MathsUploadState();
}

class _MathsUploadState extends State<MathsUpload> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName =
        file != null ? Path.basename(file!.path) : 'No File Selected';
    return ExpandableNotifier(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.pink,
      ),
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/Maths.jpg'))),
        ),
        ScrollOnExpand(
            child: ExpandablePanel(
                header: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Upload Maths Notes",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                expanded: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        elevation: 5,
                        color: const Color.fromARGB(255, 83, 14, 243),
                        borderRadius: BorderRadius.circular(10.0),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
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
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                      Material(
                        elevation: 5,
                        color: const Color.fromARGB(255, 83, 14, 243),
                        borderRadius: BorderRadius.circular(10.0),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          child: const Text(
                            "Upload File",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          onPressed: () => uploadFile(),
                        ),
                      ),
                      task != null ? buildUploadStatus(task!) : Container(),
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
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                }))
      ]),
    ));
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = Path.basename(file!.path);
    final destination = 'Maths/$fileName';

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
                Navigator.pop(context,
                    MaterialPageRoute(builder: ((context) => const Upload())));
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

class ChemistryUpload extends StatefulWidget {
  const ChemistryUpload({Key? key}) : super(key: key);

  @override
  State<ChemistryUpload> createState() => _ChemistryUploadState();
}

class _ChemistryUploadState extends State<ChemistryUpload> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName =
        file != null ? Path.basename(file!.path) : 'No File Selected';
    return ExpandableNotifier(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.pink,
      ),
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/Maths.jpg'))),
        ),
        ScrollOnExpand(
            child: ExpandablePanel(
                header: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Upload Maths Notes",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                expanded: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        elevation: 5,
                        color: const Color.fromARGB(255, 83, 14, 243),
                        borderRadius: BorderRadius.circular(10.0),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
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
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                      Material(
                        elevation: 5,
                        color: const Color.fromARGB(255, 83, 14, 243),
                        borderRadius: BorderRadius.circular(10.0),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          child: const Text(
                            "Upload File",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                          onPressed: () => uploadFile(),
                        ),
                      ),
                      task != null ? buildUploadStatus(task!) : Container(),
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
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                }))
      ]),
    ));
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = Path.basename(file!.path);
    final destination = 'Maths/$fileName';

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
                Navigator.pop(context,
                    MaterialPageRoute(builder: ((context) => const Upload())));
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
