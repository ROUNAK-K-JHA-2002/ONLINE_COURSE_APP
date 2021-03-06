import 'package:eduapp/Screens/DownloadPage.dart';
import 'package:eduapp/Screens/ProfilePage.dart';
import 'package:eduapp/Screens/RoleBasedHomeScreens/TeacherHomeGsign.dart';
import 'package:eduapp/Screens/UploadsPage.dart';
import 'package:eduapp/subject_Pages/ChemistryPage.dart';
import 'package:eduapp/subject_Pages/LifeSciPage.dart';
import 'package:eduapp/subject_Pages/MathsPage.dart';
import 'package:eduapp/subject_Pages/PhysicsPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(
              title: '',
            ),
        '/HomePage': (context) => const AdminPageGsign(),
        '/UploadPage': (context) => const UploadPage(),
        '/Downloadpage': (context) => const DownloadPage(),
        '/ProfilePage': (context) => const ProfilePage(),
        '/MathsPage': (context) => const MathsPage(title: ''),
        '/ChemistryPage': (context) => const ChemistryPage(title: ''),
        '/PhysicsPage': (context) => const PhysicsPage(title: ''),
        '/LifeSciPage': (context) => const LifeSciencePage(title: ''),
      },
    );
  }
}
