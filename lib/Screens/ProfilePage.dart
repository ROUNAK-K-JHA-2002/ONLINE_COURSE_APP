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
        backgroundColor: Colors.blue,
        title: Text("hello"),
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
              Text("data")
            ]),
          ),
          Expanded(
              child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  // height: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.green,
                  child: Row(children: const <Widget>[
                    Icon(
                      Icons.key_rounded,
                      size: 40.0,
                    ),
                    Expanded(child: Text("Change password"))
                  ]),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  // height: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.green,
                  child: Row(children: const <Widget>[
                    Icon(
                      Icons.key_rounded,
                      size: 40.0,
                    ),
                    Expanded(child: Text("Change password"))
                  ]),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  // height: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.green,
                  child: Row(children: const <Widget>[
                    Icon(
                      Icons.key_rounded,
                      size: 40.0,
                    ),
                    Expanded(child: Text("Change password"))
                  ]),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  // height: MediaQuery.of(context).size.height * 0.02,
                  color: Colors.green,
                  child: Row(children: const <Widget>[
                    Icon(
                      Icons.key_rounded,
                      size: 40.0,
                    ),
                    Expanded(child: Text("Change password"))
                  ]),
                ),
              ),
              Container(
                color: Colors.amber,
                width: MediaQuery.of(context).size.width * 1,
                child: Column(children: <Widget>[
                  Text(
                    "data",
                  ),
                  Text("data"),
                  Text("data")
                ]),
              )
            ],
          ))
        ]),
      ),
    );
  }
}
