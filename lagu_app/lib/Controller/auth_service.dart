import 'package:firebase_auth/firebase_auth.dart';
import 'package:lagu_app/Controller/user_handler.dart';

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

  Future<bool> checkUserInfoUpdated() async {
    bool result = false;
    try {
      result = await UserHandler.instance.checkIfUserExists(getCurrentUID());
    } catch (e) {
      result = false;
    }

    return result;
  }

  createUserWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return OK;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ERR_WEAK_PASSWORD;
      } else if (e.code == 'email-already-in-use') {
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
