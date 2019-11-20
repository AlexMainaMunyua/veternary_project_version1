import 'package:flutter/material.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';
import 'package:veternary_project_version1/pages/rootpage.dart';

class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(
            builder: (_)=> RootPage(auth: Auth())
        );
      default:
        return MaterialPageRoute(
          builder: (_)=> Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          )
        );
    }
  }
}