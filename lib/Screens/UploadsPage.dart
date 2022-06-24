import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:eduapp/FirebaseApi/firebaseApi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadsPage extends StatefulWidget {
  const UploadsPage({Key? key}) : super(key: key);

  @override
  _UploadsPageState createState() => _UploadsPageState();
}

class _UploadsPageState extends State<UploadsPage> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName =
        file != null ? Path.basename(file!.path) : 'No File Selected';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pdf"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 5,
                color: const Color.fromARGB(255, 83, 14, 243),
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  minWidth: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Select",
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 48),
              Material(
                elevation: 5,
                color: const Color.fromARGB(255, 83, 14, 243),
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  minWidth: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Upload",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                  onPressed: () => uploadFile(),
                ),
              ),
              const SizedBox(height: 20),
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
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
    final destination = 'Chemistry/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
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
