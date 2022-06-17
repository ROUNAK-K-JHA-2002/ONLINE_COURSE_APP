// ignore: file_names
import 'package:eduapp/Google-services/firebase-services.dart';
import 'package:eduapp/Screens/HomePage.dart';
import 'package:eduapp/Screens/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Sign_Up_Screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  //form key
  // ignore: prefer_final_fields
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //Tab Controller
  // TabController tabController = TabController(length: 1, vsync: this);

  // editing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

//FireBase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //emailField
    final emailfield = TextFormField(
      autofocus: false,
      controller: emailController,
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
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Email"),
    );
    //passwordField
    final passwordfield = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
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
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Password"),
    );

    //Login button
    final loginButton = Material(
      elevation: 5,
      color: Color.fromARGB(255, 83, 14, 243),
      borderRadius: BorderRadius.circular(10.0),
      child: MaterialButton(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          "Sign in",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20.0, color: Colors.white),
        ),
        onPressed: () {
          Signin(emailController.text, passwordController.text);
        },
      ),
    );
    // ignore: non_constant_identifier_names
    final GoogleSignInBtn = Material(
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
                  child: Text(
                    "Sign In With google",
                    style: TextStyle(fontSize: 21.0),
                  ))
            ],
          ),
          onPressed: () async {
            await FirebaseServices().SignInWithGoogle();
            print("Checking");
            Navigator.pushNamed(context, '/home');
          },
        ));

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(235, 86, 61, 248),
              Color.fromARGB(255, 226, 3, 255),
            ],
          ),
        ),
        child: Column(children: <Widget>[
          Expanded(
              flex: 2,
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.7,
                child: Image.asset('assets/images/login_logo.png'),
              )),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.03),
            child: const Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                decoration: TextDecoration.none,
                color: Color.fromARGB(255, 245, 243, 243),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromARGB(255, 251, 249, 249),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        10.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                      body: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
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
                                  text: 'Students',
                                ),
                                Tab(
                                  text: 'Teachers',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: TabBarView(
                          children: [
                            SingleChildScrollView(
                                child: Material(
                              child: Form(
                                  key: _formkey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Student's Portal",
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      emailfield,
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      passwordfield,
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      loginButton,
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const Text(
                                            "Don't have a account ? ",
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SignUp()));
                                            },
                                            child: const Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      GoogleSignInBtn,
                                      const SizedBox(
                                        height: 35,
                                      ),
                                    ],
                                  )),
                            )),
                            SingleChildScrollView(
                                child: Material(
                              child: Form(
                                  key: _formkey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Teacher's Portal",
                                        style: TextStyle(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      emailfield,
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      passwordfield,
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      loginButton,
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          const Text(
                                            "Don't have a account ? ",
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const SignUp()));
                                            },
                                            child: const Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.blue),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      GoogleSignInBtn
                                    ],
                                  )),
                            )),
                          ],
                        ))
                      ],
                    ),
                  )),
                ),
              )),
        ]),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void Signin(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Fluttertoast.showToast(msg: "Login Successful");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyStatefulWidget()));
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
