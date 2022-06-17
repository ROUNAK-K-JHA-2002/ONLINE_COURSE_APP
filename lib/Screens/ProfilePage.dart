import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Profile Page"),
      ),
      body: Container(
        color: Colors.amber.shade50,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.05),
            child: Column(children: const <Widget>[
              Icon(
                Icons.account_circle,
                size: 100.0,
              ),
              Text(
                " DEBUG TESTER",
                style: TextStyle(fontSize: 25.0),
              )
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
                      color: Colors.pink.shade100,
                    ),
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    // height: MediaQuery.of(context).size.height * 0.02,

                    child: Row(children: const <Widget>[
                      Icon(
                        Icons.person,
                        size: 30.0,
                      ),
                      Expanded(
                          child: Text(
                        "   Profile Details",
                        style: TextStyle(fontSize: 20.0),
                      ))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    // height: MediaQuery.of(context).size.height * 0.02,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.pink.shade100,
                    ),
                    child: Row(children: const <Widget>[
                      Icon(
                        Icons.percent_rounded,
                        size: 30.0,
                      ),
                      Expanded(
                          child: Text(
                        "  See Progress",
                        style: TextStyle(fontSize: 20.0),
                      ))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    // height: MediaQuery.of(context).size.height * 0.02,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.pink.shade100,
                    ),
                    child: Row(children: const <Widget>[
                      Icon(
                        Icons.key_rounded,
                        size: 30.0,
                      ),
                      Expanded(
                          child: Text(
                        "   Change password",
                        style: TextStyle(fontSize: 20.0),
                      ))
                    ]),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    // height: MediaQuery.of(context).size.height * 0.02,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.pink.shade100,
                    ),
                    child: Row(children: const <Widget>[
                      Icon(
                        Icons.offline_bolt,
                        size: 30.0,
                      ),
                      Expanded(
                          child: Text(
                        "   Delete Account",
                        style: TextStyle(fontSize: 20.0),
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
                      child: const Text(
                        "Dextrix Limited corporation",
                        style: TextStyle(
                            fontSize: 23.0, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.01),
                      child: const Text(
                        "by ROUNAK KUMAR JHA",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.01),
                      child: const Text(
                        "Version : 1:16.06.2022",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w300),
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
