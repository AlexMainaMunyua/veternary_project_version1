import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/constants/string.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';
import 'package:veternary_project_version1/pages/sign_in/email_password/email_password_sign_in_page.dart';
import 'package:veternary_project_version1/pages/sign_in/sign_in_manager.dart';

class SignInPageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth =Provider.of<AuthService>(context);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      builder: (_)=> ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, ValueNotifier<bool>isLoading, __)=>
          Provider<SignInManager>(
            builder: (_)=> SignInManager(auth: auth, isLoading: isLoading),
            child: Consumer<SignInManager>(
              builder: (_, SignInManager manager, __) => SignInPage._(
                isLoading: isLoading.value,
                manager: manager,
                title: 'Veternary_project'
              ),
            )
          ),
      ),
    );
  }
}
class SignInPage extends StatelessWidget {
  const SignInPage._({Key key, this.isLoading, this.manager, this.title})
  : super(key: key);

  final SignInManager manager;
  final String title;
  final bool isLoading;

  static const Key emailPasswordButtonKey = Key('email-password');

  Future<void> _signInWithEmailAndPassWord(BuildContext context)async{
    final navigator = Navigator.of(context);
    await EmailPasswordSignInPage.show(
      context,
      onSignedIn:navigator.pop,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(title),
      ),
      // drawer: isLoading ? null: DeveloperMenu(),
      body: _buildSignIn(context),
          );
        }
        Widget _buildHeader(){ 
          if(isLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text(
            Strings.signIn,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
          );
         }
      
        Widget _buildSignIn(BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                  child: _buildHeader(),
                ),
                SizedBox(height: 48.0,),
                SignInButton(
                  key: emailPasswordButtonKey,
                  text: Strings.signInWithEmailPassword,
                  onPressed:
                  isLoading ? null : () => _signInWithEmailAndPassWord(context),
                  textColor: Colors.white,
                  color: Colors.teal[700]
                )
              ],
            ),

          );
        }
}