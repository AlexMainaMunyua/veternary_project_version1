import 'package:flutter/material.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';

class SignInManager{
  SignInManager({@required this.auth, @required this.isLoading});

  final AuthService auth;
  final ValueNotifier<bool> isLoading;

  Future<User> _signIn(Future<User> Function() signInMethod) async{
    try{
      isLoading.value =true;
      return await signInMethod();

    }catch(e){
      isLoading.value = false;
      rethrow;
    }

  }

}