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
  Future<void> _signOut(BuildContext context) async {
    try {
      final AuthService auth = Provider.of<AuthService>(context);
      await auth.signOut();
    } on PlatformException catch (e) {
      await PlatformExceptionAlertDialog(
        title: Strings.logoutFailed,
        exception: e,
      ).show(context);
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final bool didRequestSignOut = await PlatformAlertDialog(
      title: Strings.logout,
      content: Strings.logoutAreYouSure,
      cancelActionText: Strings.cancel,
      defaultActionText: Strings.logout,
    ).show(context);
    if (didRequestSignOut == true) {
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
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              CreateUser(),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateUser extends StatelessWidget {
  const CreateUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserRow();
  }
}

class UserRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: <Widget>[
          userCard,
          userIcon,
        ],
      ),
    );
  }

  final userIcon = Container(
    margin: EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: Icon(
      Icons.person,
      size: 92,
      color: Colors.green,
    ),
  );
  final userCard = Container(
    height: 124.0,
    margin: EdgeInsets.only(left: 46.0),
    decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0))
        ]),
    child: Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 24, left: 46),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Users',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                Icon(Icons.more_vert)
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(right: 24, left: 46),
              child:
                  Text('Register new farmers', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200))),
          Container(
              padding: const EdgeInsets.only(right: 24, left: 46),
              child: Divider(
                endIndent: 140,
                thickness: 3,
                color: Colors.green,
              )),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.only(right: 90, left: 46),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.people, size: 15,color: Colors.blue),
                    SizedBox(width: 5,),
                    Text('280',style: TextStyle(fontSize: 10, color: Colors.blue),)
                  ],
                ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.rss_feed, size: 15,color: Colors.red,),
                    SizedBox(width: 5,),
                    Text('15',style: TextStyle(fontSize: 10, color: Colors.red,),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
