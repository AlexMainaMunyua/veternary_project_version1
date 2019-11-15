import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[400],
        title: Text("Veternary"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){})

        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(""),
            )
          ],
        ),
      ),

    );
  }
}
