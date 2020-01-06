import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/core/model/veternaryModel.dart';
import 'package:veternary_project_version1/core/view/CrudModel.dart';
import 'package:veternary_project_version1/pages/registration/viewusers.dart';

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
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ModifyFarmer(user: user)));
              },
            ),
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
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                            'Are you sure you want to delete' +
                                " " +
                                '${user.firstName}',
                            style: TextStyle(fontSize: 16),
                          ),
                          actions: <Widget>[
                            FlatButton(
                                child: Text('Yes'),
                                onPressed: () async {
                                  await farmerProvider
                                      .removeUserFarmerRecord(user.id);
                                  Navigator.pop(context);
                                }),
                            FlatButton(
                              child: Text('No'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ));
              },
              /*  onPressed: () async {
                await farmerProvider.removeUserFarmerRecord(user.id);
                Navigator.pop(context);
              }, */
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
            Detail(user: user),
            Record(),
          ],
        ),
      ),
    );
  }
}

class Detail extends StatefulWidget {
  final UserFarmer user;

  const Detail({Key key, this.user}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Table(
        border: TableBorder.all(width: 1.0, color: Colors.grey.shade300),
        children: [
          TableRow(decoration: BoxDecoration(color: Colors.green), children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Fields',
                style: TextStyle(color: Colors.white),
              ),
            )),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Details',
                style: TextStyle(color: Colors.white),
              ),
            )),
          ]),
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('First Name'),
            )),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.user.firstName}'),
            )),
          ]),
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Last Name'),
            )),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.user.lastName}'),
            )),
          ]),
          TableRow(children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Farm Name'),
              ),
            ),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.user.farmName}'),
            )),
          ]),
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Email Address'),
            )),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.user.emailAddress}'),
            )),
          ]),
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Phone Number'),
            )),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.user.phoneNumber}'),
            )),
          ]),
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Country Name'),
            )),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.user.country}'),
            )),
          ]),
          TableRow(children: [
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Gender'),
            )),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${widget.user.gender}'),
            )),
          ]),
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
