import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance; //calling Firebase Auth
  final _googlesignin = GoogleSignIn(); //calling Google Sign In function

  // ignore: non_constant_identifier_names
  SignInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googlesignin.signIn();
      print("object1");
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        print(googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
        print("object2");
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googlesignin.signOut();
  }
}
