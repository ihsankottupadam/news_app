import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/util/util.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        Util.showError('Password is too weak');
      } else if (e.code == 'email-already-in-use') {
        Util.showError('Email already exists');
      }
    } catch (e) {
      Util.showError('SignUp failed !');
    }
  }

  static Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        Util.showError('No user Found with this Email');
      } else if (e.code == 'wrong-password') {
        Util.showError('Password did not match');
      }
    } catch (e) {
      Util.showError('SignIp failed !');
    }
  }

  static signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Util.showError('Error signout');
    }
  }
}
