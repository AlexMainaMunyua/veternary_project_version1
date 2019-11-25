import 'dart:async';

import 'package:flutter/material.dart';
import 'package:veternary_project_version1/core/services/auth_service_type.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';


enum AuthServiceType{firebase}

class AuthServiceAdapter implements AuthService{
  AuthServiceAdapter({@required AuthServiceType initialAuthServiceType})
  : authServiceTypeNotifier =
       ValueNotifier<AuthServiceType>(initialAuthServiceType){
         _setup();
                }
                final FirebaseAuthService _firebaseAuthService =FirebaseAuthService();
                // final MockAuthService _mockAuthService =  MockAuthService();

                final ValueNotifier<AuthServiceType> authServiceTypeNotifier;
                AuthServiceType get authServiceType => authServiceTypeNotifier.value;
                AuthService get authservice => authServiceType ==AuthServiceType.firebase
                ? _firebaseAuthService
                : _firebaseAuthService;

                StreamSubscription<User> _firebaseAuthSubscription;
                
           void _setup() {
             _firebaseAuthSubscription =
             _firebaseAuthService.onAuthStateChanged.listen((User user){
               if(authServiceType == AuthServiceType.firebase){
                 _onAuthStateChangeController.add(user);
               }
             }, onError: (dynamic error){
               if(authServiceType == AuthServiceType.firebase){
                 _onAuthStateChangeController.addError(error);
               }
             }
             
             );

           }
           final StreamController<User> _onAuthStateChangeController =
           StreamController<User>.broadcast();
           @override
           Future<void> changeEmail(String email) {
             return null;
           }
         
           @override
           Future<void> changePassword(String password) {
             // TODO: implement changePassword
             return null;
           }
         
           @override
           Future<User> createUserWithEmailAndPassword(String email, String password) {
             return authservice.createUserWithEmailAndPassword(email, password);
           }
         
           @override
           Future<void> deleteUser() {
             // TODO: implement deleteUser
             return null;
           }
         
           @override
           void dispose() {
             _firebaseAuthSubscription?.cancel();
             _onAuthStateChangeController?.close();
             authServiceTypeNotifier.dispose();
           }
         
           @override
           Future<User> getCurrentUser() {
             return authservice.getCurrentUser();
           }
         
           @override
           Future<bool> isEmailVerified() {
             return null;
           }
         
           @override
           Stream<User> get onAuthStateChanged => _onAuthStateChangeController.stream;
         
           @override
           Future<void> sendEmailVerification() {
             // TODO: implement sendEmailVerification
             return null;
           }
         
           @override
           Future<void> sendPasswordResetMail(String email) {
             return authservice.sendPasswordResetMail(email);
           }
         
           @override
           Future<User> signInWithEmailAndPassword(String email, String password) {
             return authservice.signInWithEmailAndPassword(email, password);
           }
         
           @override
           Future<void> signOut() {
             return authservice.signOut();
           }
         
          

}