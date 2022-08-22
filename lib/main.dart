import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduapp/Screens/DownloadPage.dart';
import 'package:eduapp/Screens/ProfilePage.dart';
import 'package:eduapp/Screens/RoleBasedHomeScreens/GSignInHome.dart';
import 'package:eduapp/Screens/UploadsPage.dart';
import 'package:eduapp/Screens/test.dart';
import 'package:eduapp/subject_Pages/ChemistryPage.dart';
import 'package:eduapp/subject_Pages/LifeSciPage.dart';
import 'package:eduapp/subject_Pages/MathsPage.dart';
import 'package:eduapp/subject_Pages/PhysicsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

User? userFlag = FirebaseAuth.instance.currentUser;
void Checkuser() {
  if (userFlag != null) {
    print(userFlag);
  } else {
    // print("null");
  }
}

String? roleData = "";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<String?> getRoleData() async {
    SharedPreferences Data = await SharedPreferences.getInstance();
    String? role = Data.getString('roleData');
    // print(" role is $role");
    roleData = role;

    return role;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Checkuser();

    getRoleData();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edu_App',
      theme: ThemeData(
        // This is the theme of your application
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/' : '/HomePage',

      // initialRoute: "/",
      routes: {
        '/': (context) => const Testing(
              title: '',
            ),
        '/HomePage': (context) => const GSignHomePage(
              role: '',
            ),
        '/UploadPage': (context) => const UploadPage(),
        '/Downloadpage': (context) => const DownloadPage(),
        '/ProfilePage': (context) => const ProfilePage(),
        '/MathsPage': (context) => const MathsPage(
              title: '',
            ),
        '/ChemistryPage': (context) => const ChemistryPage(title: ''),
        '/PhysicsPage': (context) => const PhysicsPage(title: ''),
        '/LifeSciPage': (context) => const LifeSciPage(title: ''),
      },
    );
  }
}
