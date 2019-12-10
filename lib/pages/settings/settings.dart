import 'package:flutter/material.dart';
import 'package:veternary_project_version1/pages/registration/registrationForm.dart';



class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Settings',
        style: TextStyle(
          fontFamily: 'Righteous',
        ),
      )),
      body: Container(
        child: ListView(
          children: <Widget>[
            //////////////////////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////////////////
            Container(
              height: 80,
              color: Colors.grey.shade300,
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'PERSONAL DETAILS',
                    style: TextStyle(
                        fontFamily: 'Righteous',
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationForm()));
                    },
                  )
                ],
              ),
            ),
            ListTile(
              leading: Text(
                "First Name",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "LastName",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "Name Of the Farm",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "Phone Number",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(""),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "Country Name",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(
                "KENYA",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "County Name",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(
                "",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "Email Address",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text(
                "expamle@gmail.com",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Text(
                "Password",
                style: TextStyle(
                  fontFamily: 'Righteous',
                ),
              ),
              trailing: Text("**********"),
            ),
         
           
            /////////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////////
            Container(
              height: 80,
              color: Colors.grey.shade300,
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Account Setting',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  // IconButton(icon: Icon(Icons.edit), onPressed: (){},)
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'DeActivate Your Account',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Deactivating your account will disable your profile and remove your created vet',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  child: Text(
                    'DeActivate Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.greenAccent.shade700),
                  ),
                  onPressed: () {},
                ))
          ],
        ),
      ),
    );
  }
}
