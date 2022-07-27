import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.004),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(235, 140, 172, 254),
              Color.fromARGB(245, 186, 248, 182),
              Color.fromARGB(245, 245, 244, 173),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width * 1,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(235, 195, 0, 255),
                  Color.fromARGB(255, 254, 24, 124),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(125, 5, 5, 5),
                    blurRadius: 5,
                    spreadRadius: 5,
                    offset: Offset(5, 5)),
              ],
              borderRadius: BorderRadius.circular(35.0),
            ),
            width: MediaQuery.of(context).size.width * 1,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.1,
                bottom: MediaQuery.of(context).size.width * 0.15),
            child: Column(children: <Widget>[
              Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.15,
                    backgroundImage: NetworkImage(
                        FirebaseAuth.instance.currentUser!.photoURL!),
                  )),
              Column(children: [
                AutoSizeText(
                  "${FirebaseAuth.instance.currentUser!.displayName}",
                  style: const TextStyle(color: Colors.white, fontSize: 25.0),
                  maxLines: 1,
                ),
                AutoSizeText(
                  "${FirebaseAuth.instance.currentUser!.email}",
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  maxLines: 1,
                ),
              ]),
            ]),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color.fromARGB(224, 255, 255, 255),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(79, 5, 5, 5),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: Offset(3, 3)),
                      ],
                    ),
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    child: Row(children: const <Widget>[
                      Icon(
                        Icons.person,
                        size: 30.0,
                        color: Color.fromARGB(255, 137, 94, 255),
                      ),
                      Expanded(
                          child: AutoSizeText(
                        "   Profile Details",
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.deepPurpleAccent),
                        maxLines: 1,
                      ))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color.fromARGB(224, 255, 255, 255),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(79, 5, 5, 5),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: Offset(3, 3)),
                      ],
                    ),
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    child: Row(children: const <Widget>[
                      Icon(
                        Icons.grade_rounded,
                        size: 30.0,
                        color: Color.fromARGB(255, 137, 94, 255),
                      ),
                      Expanded(
                          child: AutoSizeText(
                        "   See Progress",
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.deepPurpleAccent),
                        maxLines: 1,
                      ))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color.fromARGB(224, 255, 255, 255),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(79, 5, 5, 5),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: Offset(3, 3)),
                      ],
                    ),
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    child: Row(children: const <Widget>[
                      Icon(
                        Icons.key_rounded,
                        size: 30.0,
                        color: Color.fromARGB(255, 137, 94, 255),
                      ),
                      Expanded(
                          child: AutoSizeText(
                        "   Password change",
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.deepPurpleAccent),
                        maxLines: 1,
                      ))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color.fromARGB(224, 255, 255, 255),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(79, 5, 5, 5),
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: Offset(3, 3)),
                      ],
                    ),
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    child: Row(children: const <Widget>[
                      Icon(
                        Icons.dangerous_rounded,
                        size: 30.0,
                        color: Color.fromARGB(255, 137, 94, 255),
                      ),
                      Expanded(
                          child: AutoSizeText(
                        "   Delete Account",
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.deepPurpleAccent),
                        maxLines: 1,
                      ))
                    ]),
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.02),
                      child: const AutoSizeText(
                        "Dextrix Limited corporation",
                        style: TextStyle(
                            fontSize: 23.0, fontWeight: FontWeight.w300),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.01),
                      child: const AutoSizeText(
                        "by ROUNAK KUMAR JHA",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.01),
                      child: const AutoSizeText(
                        "Version : 1:24.07.2022",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w300),
                        maxLines: 1,
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
