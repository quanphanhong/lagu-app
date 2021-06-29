import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  static const OK = 0;
  static const ERR_WEAK_PASSWORD = 1;
  static const ERR_INVALID_EMAIL = 2;
  static const ERR_USER_NOT_EXISTS = 3;
  static const ERR_WRONG_PASSWORD = 4;
  static const ERR_FAILED = 5;

  Stream<User> get onAuthStateChanged =>
      FirebaseAuth.instance.authStateChanges();

  User getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  String getCurrentUID() {
    return FirebaseAuth.instance.currentUser.uid;
  }

  createUserWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return OK;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'Your password is too weak!');
        return ERR_WEAK_PASSWORD;
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'Your email has been used!');
        return ERR_INVALID_EMAIL;
      }
    } catch (e) {
      return ERR_FAILED;
    }
  }

  signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return OK;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ERR_USER_NOT_EXISTS;
      } else if (e.code == 'wrong-password') {
        return ERR_WRONG_PASSWORD;
      }
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
