import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
  Future<String> signIn(String email, String password);

  Future<String> signUp(String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<void> changeEmail(String email);

  Future<void> changePassword(String password);

  Future<void> deleteUser();

  Future<void> sendPasswordResetMail(String email);

}

class Auth extends BaseAuth{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> changeEmail(String email) async {
       FirebaseUser user = await _firebaseAuth.currentUser();
    user.updateEmail(email).then((_){
      print("Successfull changed email");

    }).catchError((error){
      print("email cant\'t be changed"+ error.toString());
    });


    return null;
  }

  @override
  Future<void> changePassword(String password) async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.updatePassword(password).then((_){
      print("Succefull changed password");

    }).catchError((error){
      print("Password cant\'t be changed"+ error.toString());

    });

    return null;
  }

  @override
  Future<void> deleteUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.delete().then((_){
      print("Succefull user deleted");
    }).catchError((error){
      print("user cant\'t be delete"+ error.toString());
    });
    return null;
  }

  @override
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  @override
  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
  

    return user.isEmailVerified;
  }

  @override
  Future<void> sendEmailVerification() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  
  }

  @override
  Future<void> sendPasswordResetMail(String email)async {
    
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return null;
  }

  @override
  Future<String> signIn(String email, String password) async{
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
      email: email, password: password)).user;
    return user.uid;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<String> signUp(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password)).user;
    return user.uid;
  }
  }