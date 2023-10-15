import 'package:firebase_auth/firebase_auth.dart';
import '../helpers/sharedPreferences.dart';
import 'databaseServices.dart';

class AuthService{

  //register
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future registerUserWithEmailAndPassword(String designation, String fullName, String email, String password) async {
    try {
      User user = ( await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password)).user!;

      if(user != null){
        await databaseServices(uid: user.uid).UpdateUserData(fullName, email);
        return true;
      }

    } on FirebaseAuthException catch(e){
      print("Error is");
      print(e);
    }
  }

  //login
  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      User user = ( await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password)).user!;

      if(user != null){
        return true;
      }

    } on FirebaseAuthException catch(e){
      print(e);
    }
  }

  //signout function
  Future signOut() async {
    try{
      await helperFunctions().saveUserLoginStatus(false);
      await helperFunctions().setUserEmail("");
      await helperFunctions().setUserName(" ");
      await firebaseAuth.signOut();
    } catch(e){
      return null;
    }
  }
}