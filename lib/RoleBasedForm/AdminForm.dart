import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduapp/Google-services/firebase-servicesAdmin.dart';
import 'package:eduapp/Screens/RoleBasedHomeScreens/GSignInHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminForm extends StatefulWidget {
  const AdminForm({Key? key}) : super(key: key);

  @override
  State<AdminForm> createState() => _AdminFormState();
}

class _AdminFormState extends State<AdminForm>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formkeyForAdmin = GlobalKey<FormState>();
  String role = "Admin";

  // editing Controller
  final TextEditingController emailControllerForAdmin = TextEditingController();
  final TextEditingController passwordControllerForAdmin =
      TextEditingController();

//FireBase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //emailFieldForAdmin
    final emailfieldForAdmin = TextFormField(
      autofocus: false,
      controller: emailControllerForAdmin,
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
        emailControllerForAdmin.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Email"),
    );
    //passwordFieldForAdmin
    final passwordfieldForAdmin = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordControllerForAdmin,
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
        passwordControllerForAdmin.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Password"),
    );

    // ignore: non_constant_identifier_names
    final GoogleSignInBtnForAdmin = Material(
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
            await FirebaseServices().SignInWithGoogleAdmin();

            SharedPreferences roleData = await SharedPreferences.getInstance();
            roleData.setString('roleData', "AdminGSign");
            print("23");

            final user = FirebaseAuth.instance.currentUser!;

            final json = {
              "User-Id": user.uid,
              "User-Name": user.displayName,
              "User-Email": user.email,
            };
            // ignore: non_constant_identifier_names
            final TeacherList = FirebaseFirestore.instance
                .collection("Teacher-List")
                .doc("user");
            await TeacherList.set(json);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const GSignHomePage(
                    role: "Admin",
                  ),
                ));
            Fluttertoast.showToast(msg: "Login Sucessful");
          },
        ));

    return SingleChildScrollView(
        child: Material(
      child: Form(
          key: _formkeyForAdmin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const AutoSizeText(
                "Teacher's Portal",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w300),
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              GoogleSignInBtnForAdmin
            ],
          )),
    ));
  }
}
