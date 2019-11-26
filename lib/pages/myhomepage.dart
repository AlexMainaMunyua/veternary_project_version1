import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/common_widgets/platform_alert_dialog.dart';
import 'package:veternary_project_version1/common_widgets/platform_exception_alert_dialog.dart';
import 'package:veternary_project_version1/constants/string.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';
import 'dart:async';

import 'package:veternary_project_version1/pages/userMenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({this.isLoading});
  final bool isLoading;

   
Future<void> _signOut(BuildContext context) async{
  try{
    final AuthService auth = Provider.of<AuthService>(context);
    await auth.signOut();
  }on PlatformException catch (e){
    await PlatformExceptionAlertDialog(
      title: Strings.logoutFailed,
      exception: e,
    ).show(context);
  }
}

Future<void>  _confirmSignOut(BuildContext context) async {
  final bool didRequestSignOut = await PlatformAlertDialog(
     title: Strings.logout,
     content: Strings.logoutAreYouSure,
     cancelActionText: Strings.cancel,
     defaultActionText: Strings.logout,
  ).show(context);
  if(didRequestSignOut ==true ){
    _signOut(context);
      }
    }
      @override
      Widget build(BuildContext context) {
        final user = Provider.of<User>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(Strings.homePage),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications_active),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: (){},
              ),
              // FlatButton(
              //   key: Key(Keys.logout,),
              //   child: Text(
              //     Strings.logout,
              //     style: TextStyle(
              //     fontSize: 18.0,
              //     color: Colors.white,
              //     ),
              //   ),
              //   onPressed: ()=> _confirmSignOut(context),
              // )
            ],
          ),
         drawer: UserMenu(), 
         );
      }
}

            
            