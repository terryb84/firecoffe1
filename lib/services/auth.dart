import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecoffe/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);

  }


  // sign in anon
  Future signInAnon() async{

    print('this signInAnon');
    try{
     AuthResult result =  await _auth.signInAnonymously();
     FirebaseUser user = result.user;
     return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email pass
  Future signInWithEmailAndPassword(String email, String password) async{
    print(email);
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim());

      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print('this error occur');
      print(e.toString());
      return null;
    }
  }


  // register with email . pass
  Future registerWithEmailAndPassword(String email, String password) async{
      print(email);
    try {
          AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim());

      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print('this error occur');
      print(e.toString());
      return null;
    }
  }

  // sign out
   Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
   }


}
