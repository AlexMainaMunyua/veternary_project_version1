import 'package:flutter/material.dart';

class EmailPasswordSignInPage extends StatefulWidget {
  const EmailPasswordSignInPage._(
    {Key key, @required this.model, this.onSignedIn}
  ): super(key : key);

  final EmailPasswordSignInModel model;
  final VoidCallback onSignedIn;

  static Future<void> show(BuildContext context, {VoidCallback onSignedIn})async{
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_)=> EmailPasswordSignInPage.create(context, onSignedIn: onSignedIn)
      )
    );
  }
  @override
  _EmailPasswordSignInPageState createState() => _EmailPasswordSignInPageState();
}

class _EmailPasswordSignInPageState extends State<EmailPasswordSignInPage> {
 
 Widget _buildContent() {
   return FocusScope(
     node: _node,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[
         SizedBox(height: 8.0,)
         _buidEmailField(),
         if(model.formType != EmailPasswordSignInFormType.forgotPassword) ...<Widget>[
           SizedBox(height: 8.0,)
           _buildPasswordField(),
         ]
       ],
     ),
   );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(model.title),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: _buildContent(),
                          ),
                        ),
                      ),
                    ),
                    
                  );
                }
              
                
}