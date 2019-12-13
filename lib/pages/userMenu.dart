import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/common_widgets/avatar.dart';
import 'package:veternary_project_version1/common_widgets/platform_alert_dialog.dart';
import 'package:veternary_project_version1/common_widgets/platform_exception_alert_dialog.dart';
import 'package:veternary_project_version1/constants/string.dart';
import 'package:veternary_project_version1/core/model/veternaryModel.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:veternary_project_version1/pages/settings/settings.dart';
import 'package:veternary_project_version1/pages/slaughterhouse_management/slaughterhouse.dart';
import 'package:veternary_project_version1/pages/vaccination/vaccination.dart';
import 'package:veternary_project_version1/pages/veterinary_clinical_approach/approach_to_sick_animal/approach_to_sick_animial.dart';
import 'package:veternary_project_version1/pages/veterinary_clinical_approach/approach_to_sick_animal/approach_to_sudden_death.dart';
import 'package:veternary_project_version1/pages/veterinary_consultation_farm_visit/veterinary_consultation_farm_visit.dart';

import 'artifical_insemination_record/artificial_insemination_record.dart';
import 'deworming/deworming.dart';
import 'veterinary_clinical_approach/approach_to_sick_animal/approach _to_surgical_operation.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({this.isLoading});
  final bool isLoading;
  @override

  // _launcher(String toMailId, String subject, String body) async {
  //   String url = 'mailto:$toMailId?subject=$subject=&body =$body';
  //   if (await canLaunch(url)) {
  //      launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("displayName"),
              accountEmail: Text('example1.gmail.com'),
              currentAccountPicture: Avatar(
                photoUrl: user.photoUrl,
                radius: 50,
                borderColor: Colors.black12,
                borderWidth: 2.0,
              ),
            ),
            _buildOptions(context),
          ],
        ),
      ),
    );
  }

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

  Widget _buildOptions(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
           ExpansionTile(
            leading: Icon(Icons.control_point_duplicate),
            title: Text('Clinical Approach'),
            children: <Widget>[
              ListTile(
                  title: Text('Sugical Operation'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SugicalOperation()))),
              ListTile(
                  title: Text('Sick Animal'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SickAnimals()))),
              ListTile(
                  title: Text('Sudden Death'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SuddenDeath())))
            ],
          ),
          ListTile(
            leading: Icon(Icons.airline_seat_legroom_normal),
            title: Text(Strings.deworming),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Deworming())),
          ),
          ListTile(
              leading: Icon(Icons.assessment),
              title: Text(Strings.vaccination),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VaccinationForm()))),
          ListTile(
              leading: Icon(Icons.art_track),
              title: Text(Strings.artificialInsemination),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AIForm()))),
          ListTile(
              leading: Icon(Icons.card_travel),
              title: Text('Consultation farm visit'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConsulationForm()))),
         
          ListTile(
            leading: Icon(Icons.hourglass_full),
            title: Text('Slaughter House'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Slaughter())),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text(Strings.historicalRecords),
            /*   onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VaccinationForm())), */
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text(Strings.gallery),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(Strings.share),
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text(Strings.rateUs),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton(
                child: Row(children: <Widget>[
                  Icon(
                    Icons.settings,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontFamily: 'Righteous',
                    ),
                  )
                ]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
              FlatButton(
                child: Row(children: <Widget>[
                  Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sign Out',
                    style: TextStyle(
                      fontFamily: 'Righteous',
                    ),
                  )
                ]),
                onPressed: () {
                  _confirmSignOut(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
