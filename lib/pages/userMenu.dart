import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/common_widgets/avatar.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';

class UserMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return SizedBox(
      width:  MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: Column(children: <Widget>[
       
                 UserAccountsDrawerHeader(
                    accountName: Text("displayName"),
                    accountEmail: Text('example.gmail.com'),
                    currentAccountPicture: Avatar(
                                            photoUrl: user.photoUrl,
                                            radius: 50,
                                            borderColor: Colors.black12,
                                            borderWidth: 2.0,
                                          ),
                                        ),
            
            
          
          _buildOptions(context),
        ],),
      ),     
    );
  }
  Widget _buildOptions(BuildContext context){
    return Expanded(
      child: ListView(
        children: <Widget>[
          ListTile(title: Text("Welcome"),)

        ],
      ),
    );
  }
}