import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
    return Scaffold(
        appBar: AppBar(title: const AutoSizeText("Download Files")),
        body: FutureBuilder<ListResult>(
          future: FirebaseStorage.instance.ref('/Chemistry').listAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final files = snapshot.data!.items;
              return ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    final file = files[index];
                    double? progress = downloadProgress[index];
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(
                          Icons.file_copy,
                          color: Colors.purpleAccent,
                        ),
                        title: Text(file.name),
                        subtitle: progress != null
                            ? LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.black,
                              )
                            : null,
                        trailing: const Icon(Icons.download),
                        onTap: () {
                          downloadfile(index, file);
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
                  color: Colors.amber,
                ),
              );
            }
          },
        ));
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
          .showSnackBar(SnackBar(content: Text('Downloded to ${file}')));
    }
  }
}
