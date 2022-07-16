import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduapp/Screens/RoleBasedHomeScreens/StudentHomeEsign.dart';
import 'package:eduapp/models/User_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/User_Model.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  //Form Key
  final _formkey = GlobalKey<FormState>();

  //Editing controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Input fields

    //firstNamefield
    final firstNamefield = TextFormField(
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Please Enter Your FirstName");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a valid FirstName.Min 3 Characters");
        }
        return null;
      },
      onSaved: (value) {
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "First Name"),
    );

    //lastNamefield
    final lastNamefield = TextFormField(
      autofocus: false,
      controller: lastNameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Please Enter Your SecondName");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a valid SecondName.Min 3 Characters");
        }
        return null;
      },
      onSaved: (value) {
        lastNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Last Name"),
    );

    //Email field
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
    final passwordfield1 = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController1,
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
        passwordController1.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Password"),
    );

    //passwordField
    final passwordfield2 = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController2,
      validator: (value) {
        if (passwordController2.text != value) {
          return "Password Did Not match";
        }
        return null;
      },
      onSaved: (value) {
        passwordController2.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: "Comfirm Password"),
    );
    //Login button
    // ignore: non_constant_identifier_names
    final SignupButton = Material(
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
        onPressed: () {
          SignUp(emailController.text, passwordController1.text);
        },
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(240, 3, 48, 246),
                Color.fromARGB(245, 255, 4, 130),
              ],
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.15,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset('assets/images/signup.png'),
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.03),
                      child: const Text(
                        "Welcome",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(255, 135, 2, 251),
                        ),
                      ),
                    )),
                Expanded(
                  flex: 4,
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: Material(
                          child: SingleChildScrollView(
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              firstNamefield,
                              const SizedBox(
                                height: 15,
                              ),
                              lastNamefield,
                              const SizedBox(
                                height: 15,
                              ),
                              emailfield,
                              const SizedBox(
                                height: 15,
                              ),
                              passwordfield1,
                              const SizedBox(
                                height: 15,
                              ),
                              passwordfield2,
                              const SizedBox(
                                height: 15,
                              ),
                              SignupButton,
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ))),
                )
              ],
            ),
          )),
    );
  }

  // ignore: non_constant_identifier_names
  void SignUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {PostDetailsToFireBase()})
          .catchError((e) => {Fluttertoast.showToast(msg: e!.message)});
    }
  }

  // ignore: non_constant_identifier_names
  PostDetailsToFireBase() async {
    //Calling firebase
    //Calling usermodal
    //sending Values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModal userModal = UserModal();

    //writing all values
    userModal.uid = user!.uid;
    userModal.email = user.email;
    userModal.firstName = firstNameController.text;
    userModal.secondName = lastNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModal.toMap());

    Fluttertoast.showToast(msg: "Account Created succesfully");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const StudentPageEsign()));
  }
}
