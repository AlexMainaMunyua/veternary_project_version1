import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///home/aleckie/AndroidStudioProjects/veternary_project_version1/lib/locator.dart';
import 'file:///home/aleckie/AndroidStudioProjects/veternary_project_version1/lib/route.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
  return Center(
    child: Text(
      'Error appeared.',
      style: TextStyle(color: Colors.red, fontSize: 24.0),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        builder: (BuildContext context, Widget widget){
          ErrorWidget.builder = (FlutterErrorDetails errorDetails){
            return getErrorWidget(context, errorDetails);
          };
          return widget;
        },
        debugShowCheckedModeBanner: false,
        title: 'Veternary App',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
