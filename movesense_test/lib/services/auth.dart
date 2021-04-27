import 'package:firebase_auth/firebase_auth.dart';
import 'package:movesense_test/services/Library.dart';
import 'package:movesense_test/services/Data.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DataService _data = DataService();

  // sign in user
  Future signIn(String email, String password) async {
    print(email + ' ' + password);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(email + ' ' + password);
      userID = userCredential.user.uid;
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return ('NoUser');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return ('WrongPass');
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register user
  Future register(String email, String password) async {
    print('Register');
    print(email + ' ' + password);
    try {
      print(email + ' ' + password);
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      print('After');
      userID = userCredential.user.uid;
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return ('WeakPass');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return ('UsedEmail');
      }
    }
  }
  // sign out
}
