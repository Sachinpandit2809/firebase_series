import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/utils/utils.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signUpMethod(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        Utils().toastErrorMessage("email already available");
      } else {
        Utils().toastErrorMessage("Some error occured ${e.code}");
      }
    }
    return null;
  }

  Future<User?> logInMethod(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        Utils().toastErrorMessage("Invalid email and password!");
      } else {
        Utils().toastErrorMessage("Some error occured ${e.code}");
      }
    }
    return null;
  }
}
