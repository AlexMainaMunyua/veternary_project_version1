import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/common_widgets/avatar.dart';
import 'package:veternary_project_version1/common_widgets/platform_alert_dialog.dart';
import 'package:veternary_project_version1/common_widgets/platform_exception_alert_dialog.dart';
import 'package:veternary_project_version1/constants/keys.dart';
import 'package:veternary_project_version1/constants/string.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';

import 'dart:async';
import 'package:flutter/services.dart';
class UserMenu extends StatelessWidget {
  const UserMenu({this.isLoading});
  final bool isLoading;
  @override

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return SizedBox(
      width:  MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: Column(children: <Widget>[
       
                 UserAccountsDrawerHeader(
                    accountName: Text("displayName"),
                    accountEmail: Text('example.gmail.com'),
                    currentAccountPicture: Avatar(
                                            photoUrl: user.photoUrl,
                                            radius: 50,
                                            borderColor: Colors.black12,
                                            borderWidth: 2.0,
                                          ),
                                        ),
            
            
          
          _buildOptions(context),
        ],),
      ),     
    );
  }
  Future<void> _signOut(BuildContext context)async{
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
  Future<void> _confirmSignOut(BuildContext context)async{
final bool didRequestSignOut = await PlatformAlertDialog(
 title:  Strings.logout,
 content: Strings.logoutAreYouSure,
 cancelActionText:  Strings.cancel,
 defaultActionText: Strings.logout,
).show(context);
if(didRequestSignOut ==true){
  _signOut(context);
}
  }
  Widget _buildOptions(BuildContext context){
    return Expanded(
      child: ListView(
        children: <Widget>[
          ExpansionTile(
            leading: Icon(Icons.airline_seat_legroom_normal),
            title: Text(Strings.deworming),
            children: <Widget>[
              Divider(),
              ListTile( title: Text(Strings.cattle),trailing: Icon(Icons.arrow_forward_ios),),
              Divider(),
              ListTile( title: Text(Strings.dog),trailing: Icon(Icons.arrow_forward_ios),),
              Divider(),
              ListTile( title: Text(Strings.poultry),trailing: Icon(Icons.arrow_forward_ios),),
              Divider(),
              ListTile( title: Text(Strings.goat),trailing: Icon(Icons.arrow_forward_ios),),
              Divider(),
              ListTile( title: Text(Strings.sheep),trailing: Icon(Icons.arrow_forward_ios),),
              Divider(),
              ListTile( title: Text(Strings.horse),trailing: Icon(Icons.arrow_forward_ios),),
              Divider(),
              ListTile( title: Text(Strings.donkey),trailing: Icon(Icons.arrow_forward_ios),),

            ],
          ),
          ListTile(
            leading: Icon(Icons.assessment),
            title: Text(Strings.vaccination),),
          ListTile(
            leading: Icon(Icons.art_track),
            title: Text(Strings.artificialInsemination),),
          ListTile(
            leading: Icon(Icons.history),
            title: Text(Strings.historicalRecords),),
           ListTile(
            leading: Icon(Icons.image),
            title: Text(Strings.gallery),),
            Divider(),
            //  ListTile(
            // leading: Icon(Icons.share),
            // title: Text(Strings.share),),
            //  ListTile(
            // leading: Icon(Icons.rate_review),
            // title: Text(Strings.rateUs),),
            ListTile(
            leading: Icon(Icons.settings),
            title: Text(Strings.settings),),
           ListTile(
             key: Key(Keys.logout),
            leading: Icon(Icons.cancel,color: Colors.red,),
            title: Text(Strings.logout),
            onTap: ()=> _confirmSignOut(context),
            )
            
        ],
      ),
    );
  }
}


