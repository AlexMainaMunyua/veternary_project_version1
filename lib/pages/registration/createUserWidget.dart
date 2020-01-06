import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'registrationForm.dart';
import 'viewusers.dart';

class Constants {
  static const String AddUser = 'Add new user';
  static const String ViewUser = 'View all users';
  static const List<String> choices = <String>[AddUser, ViewUser];
}

class CreateUser extends StatelessWidget {
  const CreateUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserRow();
  }
}

class UserRow extends StatefulWidget {
  @override
  _UserRowState createState() => _UserRowState();
}

class _UserRowState extends State<UserRow> {
  int documentNumber;
 /*  Future totalDocuments() async{
    var respectQuery = Firestore.instance.collection('Users');
    var querySnapshot = await respectQuery.getDocuments();
    var totalEquals = querySnapshot.documents.length;
    return totalEquals;
  } */
  
  void totalDocuments() async{
    QuerySnapshot _myDoc = await Firestore.instance.collection('Users').getDocuments();
    List<DocumentSnapshot> _myDocCount = _myDoc.documents;
    var totalDoc = _myDocCount.length;
    // print(_myDocCount.length);
    // print(totalDoc);
    setState(() {
      documentNumber = totalDoc;
    });
  
  }

  @override
  Widget build(BuildContext context) {
    void choiceAction(String choice) {
      if (choice == Constants.AddUser) {
        print('add User');
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RegistrationForm()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ViewUser()));
        print('view user');
      }
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
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
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
                  PopupMenuButton<String>(
                    onSelected: choiceAction,
                    itemBuilder: (BuildContext context) {
                      return Constants.choices.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Text(choice)),
                        );
                      }).toList();
                    },
                  )
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.only(right: 24, left: 15),
                child: Text('Registration dashboard',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w200))),
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
                      Icon(Icons.people, size: 15, color: Colors.blue),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${documentNumber}',
                        style: TextStyle(fontSize: 10, color: Colors.blue),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.rss_feed,
                        size: 15,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                      '',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
 
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
}
