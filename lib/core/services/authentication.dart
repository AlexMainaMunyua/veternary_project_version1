import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class User{
  const User({
    @required this.uid,
    this.email,
    this.photoUrl,
    this.displayName,
  });

  final String uid;
  final String email;
  final String photoUrl;
  final String displayName;
}

abstract class AuthService{
  Future<User> signInWithEmailAndPassword(String email, String password);

  Future<User> createUserWithEmailAndPassword(String email, String password);

  Future<User> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<void> changeEmail(String email);

  Future<void> changePassword(String password);

  Future<void> deleteUser();

  Future<void> sendPasswordResetMail(String email);

  Stream<User> get onAuthStateChanged;

  void dispose();

}

class Auth extends AuthService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user){
    if(user == null){
      return null;
    }
    return User(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl
    );
  }
  // @override
  Stream<User> get onAuthStateChanged{
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

    @override
  Future<User> signInWithEmailAndPassword(String email, String password) async{
    final AuthResult authResult = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.getCredential(
        email: email,
        password: password
      )
    );
    return _userFromFirebase(authResult.user);
  
  }

  Future<User> createUserWithEmailAndPassword(String email, String password) async {
   final AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
        return _userFromFirebase(authResult.user);
  }

  @override
  Future<User> getCurrentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }


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
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  void dispose() {
  }
  
  }