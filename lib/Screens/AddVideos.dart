import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddVideos extends StatefulWidget {
  final String SubjectName;
  const AddVideos({required this.SubjectName});

  @override
  State<AddVideos> createState() => _AddVideosState();
}

class _AddVideosState extends State<AddVideos> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ytLinkController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TitleInput = TextFormField(
      autofocus: false,
      autocorrect: true,
      controller: titleController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        titleController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter a Video Title");
        }

        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.assignment_turned_in_rounded),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: "Enter Video Title",
      ),
    );
    final YTLinkInput = TextFormField(
      autofocus: false,
      autocorrect: true,
      controller: ytLinkController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        titleController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter a Youtube Link");
        }

        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.assignment_turned_in_rounded),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: "Enter Youtube Link",
      ),
    );
    // ignore: non_constant_identifier_names
    final SendDataButton = Material(
      elevation: 5,
      color: const Color.fromARGB(255, 83, 14, 243),
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          "Add Video",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20.0, color: Colors.white),
        ),
        onPressed: () {
          SendCourseData(
              title: titleController.text, link: ytLinkController.text);
          getData();
        },
      ),
    );
    print(widget.SubjectName);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Add ${widget.SubjectName} Videos"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(235, 240, 240, 130),
              Color.fromARGB(245, 252, 223, 237),
              Color.fromARGB(245, 165, 190, 255),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.1,
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            decoration: BoxDecoration(
              color: Color.fromARGB(125, 255, 255, 255),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(200, 248, 232, 248),
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: Form(
              key: _formkey,
              child: ListView(children: [
                const SizedBox(
                  height: 50,
                ),
                TitleInput,
                const SizedBox(
                  height: 50,
                ),
                YTLinkInput,
                const SizedBox(height: 50),
                SendDataButton
              ]),
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future SendCourseData({required String title, required String link}) async {
    final data = FirebaseFirestore.instance.collection("Courses_link").doc();
    final json = {
      "title": title,
      "link": link,
    };
    if (_formkey.currentState!.validate()) await {await data.set(json)};
  }

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Courses_link");
  Future<void> getData() async {
    QuerySnapshot querySnapshot = await collectionReference.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData[1]);
  }
}
