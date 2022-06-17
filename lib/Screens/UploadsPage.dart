import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UploadsPage extends StatefulWidget {
  const UploadsPage({Key? key}) : super(key: key);

  @override
  State<UploadsPage> createState() => _UploadsPageState();
}

class _UploadsPageState extends State<UploadsPage> {
  String url = "";
  uploadDatatofirebase() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      body: Container(
        color: Colors.deepOrange,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              body: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
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
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: 'Upload',
                        ),
                        Tab(
                          text: 'Download',
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  children: [Container(), Container()],
                ))
              ],
            ),
          )),
        ),
      ),
    );
  }
}
