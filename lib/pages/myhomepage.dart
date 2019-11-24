import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/common_widgets/avatar.dart';
import 'package:veternary_project_version1/common_widgets/platform_alert_dialog.dart';
import 'package:veternary_project_version1/common_widgets/platform_exception_alert_dialog.dart';
import 'package:veternary_project_version1/constants/keys.dart';
import 'package:veternary_project_version1/constants/string.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';
import 'dart:async';

class HomePage extends StatelessWidget {
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
  if(didRequestSignOut ==true){
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
              FlatButton(
                key: Key(Keys.logout,),
                child: Text(
                  Strings.logout,
                  style: TextStyle(
                    fontSize: 18.0,
                    color:  Colors.white,
                  ),
                ),
                onPressed: ()=> _confirmSignOut(context),
                          )
                        ],
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(130.0),
                          child: _buildUserInfo(user),
                                  ),
                                ),
                              
                              );
                            }
                          
                           Widget  _buildUserInfo(User user) {
                             return Column(
                               children: <Widget>[
                                 Avatar(
                                   photoUrl: user.photoUrl,
                                   radius: 50,
                                   borderColor: Colors.black12,
                                   borderWidth: 2.0
                                 ),
                                 SizedBox(height: 8,),
                                 if(user.displayName != null)
                                 Text(
                                   user.displayName,
                                   style: TextStyle(color: Colors.white),
                                 ),
                                 SizedBox(height: 8,)
                               ],
                             );
                           }
                }
    
    
            
            