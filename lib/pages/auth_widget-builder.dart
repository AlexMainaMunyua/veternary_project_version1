import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';

class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({Key key, @required this.builder});
  final Widget Function(BuildContext, AsyncSnapshot<User>)builder;
  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<AuthService>(context);
  
    return StreamBuilder<User>(
      stream: authservice.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot){
        final User user = snapshot.data;
        if(user != null){
          return MultiProvider(
            providers: <SingleChildCloneableWidget>[
              Provider<User>.value(value: user)
              //NOTE: Any 
            ],
            child: builder(context, snapshot),

          );
          return builder(context, snapshot);
        }
      },

    );
  }
}