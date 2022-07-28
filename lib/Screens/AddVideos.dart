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
  final _formkey = GlobalKey<FormState>();
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
      controller: titleController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        titleController.text = value!;
      },
      validator: (value) {
        RegExp regex = RegExp(
            "?:https?://)?(?:www.)?youtu(?:.be/|be.com/S*(?:watch|embed)(?:(?:(?=/[-a-zA-Z0-9_]{11,}(?!S))/)|(?:S*v=|v/)))([-a-zA-Z0-9_]{11,}");
        if (value!.isEmpty) {
          return ("Please Enter a Youtube Link");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a valid youtube link");
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
          "Sign Up",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20.0, color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
    print(widget.SubjectName);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add ${widget.SubjectName} Videos"),
      ),
      body: Container(
        color: Colors.amber,
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.1,
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            color: Colors.white,
            child: Form(
              key: _formkey,
              child: Column(children: [
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
}
