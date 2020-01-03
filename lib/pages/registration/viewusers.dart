import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/core/model/veternaryModel.dart';
import 'package:veternary_project_version1/core/view/CrudModel.dart';
import 'package:veternary_project_version1/pages/registration/userDetails.dart';

class ViewUser extends StatelessWidget {
  List<UserFarmer> user;

  @override
  Widget build(BuildContext context) {
    final registeredUsersProvider = Provider.of<CRUDUserFarmerModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered Users'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: registeredUsersProvider.fetchUserFarmerRecordAsStream(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            user = snapshot.data.documents
                .map((doc) => UserFarmer.fromMap(doc.data, doc.documentID))
                .toList();
            return ListView.builder(
              itemCount: user.length,
              itemBuilder: (buildContext, index) =>
                  UserListTile(userDetails: user[index]),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            ));
          }
        },
      ),
    );
  }
}

class UserListTile extends StatefulWidget {
  final UserFarmer userDetails;

  const UserListTile({Key key, this.userDetails}) : super(key: key);

  @override
  _UserListTileState createState() => _UserListTileState();
}

class _UserListTileState extends State<UserListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=>UserDetail(user: widget.userDetails)));
      },
      child: Column(children: <Widget>[
        ListTile(
          title: Text('${widget.userDetails.firstName}' +" "+
              '${widget.userDetails.lastName}'),
          leading: CircleAvatar(
            radius: 20,
          ),
        ),
        Divider(indent: 60),
      ]),
    );
  }
}
