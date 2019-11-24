import 'package:flutter/material.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';
import 'package:veternary_project_version1/pages/myhomepage.dart';
import 'package:veternary_project_version1/pages/sign_in/sign_in_page.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key, @required this.userSnapshot}): super(key: key);
  final AsyncSnapshot<User> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if(userSnapshot.connectionState == ConnectionState.active){
      return userSnapshot.hasData ? HomePage() : SignInPageBuilder();

    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ); 
  }
}