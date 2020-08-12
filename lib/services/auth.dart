import 'package:firebase_auth/firebase_auth.dart';
import 'package:stad_project/models/user.dart';
import 'package:stad_project/services/database.dart';

class AuthService {

    final FirebaseAuth _auth = FirebaseAuth.instance;

    //Create user obj based on firebaseUser
    User _userFromFirebaseUser(FirebaseUser user) {
      return user != null ? User(uid: user.uid) : null;
    }

    //auth change user stream
    Stream<User> get user {
      return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);

    }

    //sign in anon
    Future signInAnon() async {
      try {
        AuthResult result = await _auth.signInAnonymously();
          FirebaseUser user = result.user;
          return _userFromFirebaseUser(user);
      } catch(e) {
          print(e.toString());
          return null;
      }
    }

    //sign in with email and password
    Future signInWithEmailAndPassword(String email, String password) async {
      try {
        AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;

        return _userFromFirebaseUser(user);
      } catch(e) {

        print(e.toString());
        return null;

      }
    }

    //Register with email and password
    Future registerWithEmailAndPassword(String email, String password, String displayName, String phoneNumber) async {
      try {
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
   
        FirebaseUser user = result.user;

        //Creates a new document for the user with the uid
        await DatabaseService(uid: user.uid).updateUserData(displayName, phoneNumber);

        return _userFromFirebaseUser(user);
      } catch(e) {

        print(e.toString());
        return null;

      }
    }


    //Sign out
    Future signOut() async {
      try{
        return await _auth.signOut();
      } catch(e) {
        print(e.toString());
        return null;
      }
    }

}