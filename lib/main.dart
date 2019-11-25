import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:veternary_project_version1/core/services/auth_service_adapter.dart';

import 'package:veternary_project_version1/core/services/authentication.dart';
import 'package:veternary_project_version1/core/services/email_secure_store.dart';
import 'package:veternary_project_version1/core/services/firebase_email_link_handler.dart';
import 'package:veternary_project_version1/pages/auth_widget-builder.dart';
import 'package:veternary_project_version1/pages/auth_widget.dart';
import 'package:veternary_project_version1/pages/email-link_error_presenter.dart';
import 'package:veternary_project_version1/route.dart';

import 'locator.dart';

void main() {
  Provider.debugCheckInvalidValueType= null;
  setupLocator();
  runApp(MyApp());
}

Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
  return Center(
    child: Text(
      'Error appeared.',
      style: TextStyle(color: Colors.red, fontSize: 24.0),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({this.initialAuthServiceType= AuthServiceType.firebase});
  final AuthServiceType initialAuthServiceType;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        Provider<AuthService>(
          builder: (_)=>AuthServiceAdapter(
            initialAuthServiceType: initialAuthServiceType,
          ),
          dispose: (_, AuthService authService)=> authService.dispose(),

        ),
        Provider<EmailSecureStore>(
          builder: (_)=> EmailSecureStore(flutterSecureStorage: FlutterSecureStorage()),
        ),
        ProxyProvider2<AuthService, EmailSecureStore, FirebaseEmailLinkHander>(
          builder: ( _,AuthService authService, EmailSecureStore storage, __) =>
              FirebaseEmailLinkHander.createAndConfigure(
                auth: authService,
                userCredentialsStorage: storage,
              ),
              dispose: (_, linkHandler)=> linkHandler.dispose(),
        )
      ],
      child: AuthWidgetBuilder(
        builder: (context, AsyncSnapshot<User> userSnapshot) {
          return MaterialApp(
           home: EmailLinkErrorPresenter.create(
             context,
             child: AuthWidget(userSnapshot: userSnapshot)
           ),
            debugShowCheckedModeBanner: false,
            title: 'Veternary App',
            onGenerateRoute: Router.generateRoute,
          );
        }
      ),
    );
  }
}
