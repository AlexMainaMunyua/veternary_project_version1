import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/core/model/veternaryModel.dart';
import 'package:veternary_project_version1/core/view/CrudModel.dart';

import 'modifyFarmer.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({this.user, Key key}) : super(key: key);
  final UserFarmer user;

  @override
  Widget build(BuildContext context) {
    final farmerProvider = Provider.of<CRUDUserFarmerModel>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${user.firstName}' + " " + '${user.lastName}'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ModifyFarmer(user: user)));
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () async {
                await farmerProvider.removeUserFarmerRecord(user.id);
                Navigator.pop(context);
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: 'Details',
              ),
              Tab(text: 'Records')
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Detail(),
            Record(),
          ],
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Table(
        border: TableBorder.all(width: 1.0, color: Colors.grey.shade300),
        children: [
          TableRow(children: [
            TableCell(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[Text('Fields'), Text('Details')],
            )),
          ])
          TableRow
        ],
      ),
    );
  }
}

class Record extends StatelessWidget {
  const Record({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: child,
        );
  }
}
