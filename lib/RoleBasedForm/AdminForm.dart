// ignore: file_names
import 'package:auto_size_text/auto_size_text.dart';
import 'package:eduapp/Google-services/firebase-services.dart';
import 'package:eduapp/Screens/RoleBasedHomeScreens/TeacherHomeEsign.dart';
import 'package:eduapp/Screens/RoleBasedHomeScreens/TeacherHomeGsign.dart';
import 'package:eduapp/models/User_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Screens/Sign_Up_Screen.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminForm extends StatefulWidget {
  const AdminForm({Key? key}) : super(key: key);

  @override
  State<AdminForm> createState() => _AdminFormState();
}

class _AdminFormState extends State<AdminForm>
    with SingleTickerProviderStateMixin {
  //form key
  // ignore: prefer_final_fields
  GlobalKey<FormState> _formkeyForAdmin = GlobalKey<FormState>();

  //Tab Controller
  // TabController tabController = TabController(length: 1, vsync: this);

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

    //Login button
    final loginButtonForAdmin = Material(
      elevation: 5,
      color: const Color.fromARGB(255, 83, 14, 243),
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        minWidth: MediaQuery.of(context).size.width,
        child: const AutoSizeText(
          "Sign in",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20.0, color: Colors.white),
          maxLines: 1,
        ),
        onPressed: () {
          Signin(emailControllerForAdmin.text, passwordControllerForAdmin.text);
        },
      ),
    );
    // ignore: non_constant_identifier_names
    final GoogleSignInBtnForAdmin = Material(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: const BorderSide(color: Colors.black)),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.03),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 0.08,
                    child: Image.asset('assets/images/google_logo.png'),
                  )),
              const Expanded(
                  flex: 2,
                  child: AutoSizeText(
                    "Sign In With google",
                    style: TextStyle(fontSize: 21.0),
                    maxLines: 1,
                  ))
            ],
          ),
          onPressed: () async {
            var flag = "AdminGSign";
            await FirebaseServices().SignInWithGoogle();
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: ((context) => const AdminPageGsign())));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AdminPageGsign()));
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
              emailfieldForAdmin,
              const SizedBox(
                height: 15,
              ),
              passwordfieldForAdmin,
              const SizedBox(
                height: 15,
              ),
              loginButtonForAdmin,
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const AutoSizeText(
                    "Don't have a account ? ",
                    style: TextStyle(fontSize: 19.0),
                    maxLines: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: const AutoSizeText(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                      maxLines: 1,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GoogleSignInBtnForAdmin
            ],
          )),
    ));
  }

  // ignore: non_constant_identifier_names
  Signin(String email, String password) async {
    if (_formkeyForAdmin.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Fluttertoast.showToast(msg: "Login Successful");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const AdminPageEsign()));
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
    return "AdminEsign";
  }
}
