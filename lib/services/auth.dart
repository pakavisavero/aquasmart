import 'package:firebase_auth/firebase_auth.dart';
import 'package:pkm_koi/model/User.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _userFromFirebaseUser(User user) {
    return user != null ? UserLogin(uid: user.uid) : null;
  }

  Future signInAnon() async {
    try {
      dynamic result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
