// ignore: file_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduapp/Google-services/firebase-servicesStudent.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/RoleBasedHomeScreens/GSignInHome.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({Key? key}) : super(key: key);

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm>
    with SingleTickerProviderStateMixin {
  //form key
  // ignore: prefer_final_fields
  GlobalKey<FormState> _formkeyForStudent = GlobalKey<FormState>();

  //Tab Controller
  // TabController tabController = TabController(length: 1, vsync: this);

  // editing Controller
  final TextEditingController emailControllerForStudent =
      TextEditingController();
  final TextEditingController passwordControllerForStudent =
      TextEditingController();

//FireBase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //emailFieldForStudent
    final emailfieldForStudent = TextFormField(
      autofocus: false,
      controller: emailControllerForStudent,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter a Email Address");
        }
        if (!RegExp("^[a-zA-z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email address");
        }
        return null;
      },
      onSaved: (value) {
        emailControllerForStudent.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Email"),
    );
    //passwordFieldForStudent
    final passwordfieldForStudent = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordControllerForStudent,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter a password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a valid password.Min 6 Characters");
        }
        return null;
      },
      onSaved: (value) {
        passwordControllerForStudent.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Password"),
    );

    //Login button

    // ignore: non_constant_identifier_names
    final GoogleSignInBtnForStudent = Material(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: Colors.black)),
        child: MaterialButton(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.18),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                      child: Image.asset('assets/images/google_logo.png'),
                    )),
                const Expanded(
                    flex: 5,
                    child: AutoSizeText(
                      "Sign In ",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
            onPressed: () async {
              await FirebaseServices().SignInWithGoogleStudent();
              SharedPreferences roleData =
                  await SharedPreferences.getInstance();
              roleData.setString('roleData', "StudentGsign");
              print("23");

              final user = FirebaseAuth.instance.currentUser!;
              CollectionReference collectionReference =
                  FirebaseFirestore.instance.collection("Student-List");

              QuerySnapshot querySnapshot = await collectionReference.get();
              final allData =
                  querySnapshot.docs.map((doc) => doc.get("User-Id")).toList();
              print(allData);
              for (var i = 0; i < querySnapshot.docs.length; i++) {
                if (allData[i] == user.uid) {
                  final json = {
                    "User-Id": user.uid,
                    "User-Name": user.displayName,
                    "User-Email": user.email,
                  };
                  // ignore: non_constant_identifier_names
                  final StudentList = FirebaseFirestore.instance
                      .collection("Student-List")
                      .doc();
                  await StudentList.set(json);
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GSignHomePage(
                                role: 'Student',
                              )));
                  Fluttertoast.showToast(msg: "Login Sucessful");
                } else {
                  showPopUp(context) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Permission Denied'),
                        content:
                            const Text('This Email is registerted as Teacher.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }

                  showPopUp(context);
                }
              }
            }));

    return SingleChildScrollView(
        child: Material(
      child: Form(
          key: _formkeyForStudent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const AutoSizeText(
                "Student's Portal",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w300),
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              GoogleSignInBtnForStudent
            ],
          )),
    ));
  }
}
