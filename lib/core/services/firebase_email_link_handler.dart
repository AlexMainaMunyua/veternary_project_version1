import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';
import 'package:veternary_project_version1/constants/string.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';
import 'package:veternary_project_version1/core/services/email_secure_store.dart';
import 'dart:async';

enum EmaillinkErrorType{
  linkError, isNotSignInWithEmailLink, emailNotSet, signInFailed, userAlreadySignedIn
}

class EmailLinkError{
  EmailLinkError({@required this.error, this.description});

  final EmaillinkErrorType error;
  final String description;

  Map<EmaillinkErrorType, String>get _messages => {
    EmaillinkErrorType.linkError: description,
    EmaillinkErrorType.isNotSignInWithEmailLink: Strings.isNotSignInWithEmailLinkMessage,
    EmaillinkErrorType.emailNotSet: Strings.submitEmailAgain,
    EmaillinkErrorType.signInFailed: description,
    EmaillinkErrorType.userAlreadySignedIn: Strings.userAlreadySignedIn,

  };

  String get message => _messages[error];

  @override
  String toString()=> '$error: ${_messages[error]}';

  @override
  int get hashCode => error.hashCode;

  @override
  bool operator ==(dynamic other){
    if(other is EmailLinkError){
      return error == other.error && description == other.description;
    }
    return false;
  }
}

//check incomming dynamic links and use them to sign in the use with firebase
class FirebaseEmailLinkHander with WidgetsBindingObserver{
  FirebaseEmailLinkHander({
    @required this.auth,
    @required this.widgetsBinding,
    @required this.emailStore,

  }){
    // register widegetbinding observer so that we can detect when the app is resumed
     widgetsBinding.addObserver(this);
  }
  final AuthService auth;
  final WidgetsBinding widgetsBinding;
  final EmailSecureStore emailStore;

  static FirebaseEmailLinkHander createAndConfigure({
    @required AuthService auth,
    @required EmailSecureStore userCredentialsStorage,
  }){
    final linkHandler =FirebaseEmailLinkHander(
      
      widgetsBinding: WidgetsBinding.instance,
      emailStore: userCredentialsStorage,
      auth: auth
    );
    //  check dynamic link once on app startip. This is required to process any dynamic linksthta may have opened
    //  the app when it was closed
    FirebaseDynamicLinks.instance
    .getInitialLink()
    .then((link)=> linkHandler._processDynamicLink(link?.link));
    
    //Listen to subsequent links
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (linkData)=> linkHandler.handleLink(linkData?.link),
      // convert to platformException as onlinkerrorcallback has private constructor and can't be tested
      onError: (error)=> linkHandler.handleLinkError(PlatformException(
        code: error.code,
        message: error.message,
        details: error.details,
      )),

    );
    return linkHandler;
  }

// clients can listen to this stream and show error alerts when dynamic link  processing fails
  final PublishSubject<EmailLinkError> _errorController = PublishSubject<EmailLinkError>();
  Observable<EmailLinkError> get errorStream => _errorController.stream;

// clients can listen to this stream and show a loading indicator while sign in is in progress
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future<String> getEmail() => emailStore.getEmail();

// last link data received from firebaseDynamicLinks
  Uri _lastUnprocessedLink;

//last link errir received from firebasebynamicLinks
  PlatformException _lastUnprocessedLinkError;

  Future<dynamic> handleLink(Uri link){
    _lastUnprocessedLink = link;
    _lastUnprocessedLinkError = null;
    return Future<dynamic>.value();
  }

  Future<dynamic> handleLinkError(PlatformException error){
    _lastUnprocessedLink = null;
    _lastUnprocessedLinkError = error;
    return Future<dynamic>.value();
  }

  void dispose(){
    _errorController.close();
    isLoading.dispose();
    widgetsBinding.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    // when the application come into focus
    if (state == AppLifecycleState.resumed){
      _checkUnprocessedLinks();
    }
  }

  // checks for a dynamic link, and tries to use it to sign in with email(passwordless)
  Future<void> _checkUnprocessedLinks() async{
    if (_lastUnprocessedLink != null){
      await _processDynamicLink(_lastUnprocessedLink);
      _lastUnprocessedLink = null;
    } 
    if(_lastUnprocessedLinkError != null){
      _errorController.add(EmailLinkError(
        error:  EmaillinkErrorType.linkError,
        description: _lastUnprocessedLinkError.message,
      ));
      _lastUnprocessedLinkError = null;
    }
     }
     Future<void> _processDynamicLink(Uri deepLink)async{
       if(deepLink != null){
         await _signInWithEmail(deepLink.toString());
       }
     }

     Future<void> _signInWithEmail(String link)async{
       try{
         isLoading.value = true;

         final User user = await auth.getCurrentUser();
         if(user != null){
           _errorController.add(EmailLinkError(
             error: EmaillinkErrorType.userAlreadySignedIn,
           ));
           return;
         }

         //check that email is set

         final email = await emailStore.getEmail();
         if (email == null){
           _errorController.add(EmailLinkError(
              error: EmaillinkErrorType.emailNotSet
           ));
           return;
         }
       
         // sign in
         
       }on PlatformException catch(e){
         _errorController.add(EmailLinkError(
           error: EmaillinkErrorType.signInFailed,
           description: e.message,
         ));
       }finally{
         isLoading.value =false;
       }

     } 
}