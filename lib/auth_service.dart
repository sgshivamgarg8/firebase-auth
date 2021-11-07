import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User> get authStateChanges {
    return _auth.authStateChanges();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Signed In Successfully!';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Signed Up Successfully!';
    } catch (e) {
      return e.toString();
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
      return 'Signed Out Successfully!';
    } catch (e) {
      return e.toString();
    }
  }
}
