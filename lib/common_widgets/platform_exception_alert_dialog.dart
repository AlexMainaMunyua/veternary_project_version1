import 'package:flutter/services.dart';
import 'package:veternary_project_version1/common_widgets/platform_alert_dialog.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog{
PlatformExceptionAlertDialog({String title, PlatformException exception}):
super(
  title: title,
  content: message(exception),
  defaultActionText: 'Ok',
);

 
static String message(PlatformException exception){
  if(exception.message == 'FIRFirestoreErrorDomain'){
    if (exception.code == 'Code 7'){
      return 'This operation could not be completed due to a server error';
    }
    return exception.details;
  }
  return errors[exception.code]?? exception.message;
}
 static Map<String, String> errors ={
   'ERROR_WEAK_PASSWORD': 'The password must be 8 charachters long or more.',
   'ERROR_INVALID_CREDENTIAL': 'The email is badly formatted.',
   'ERROR_EMAIL_ALREADY_IN_USE': 'The email address is already registered.',
   'ERROR_INVALID_EMAIL': 'The email is badly formatted.',
   'ERROR_WRONG_PASSWORD': 'The password is incorrect.Please try agian.',
   'ERROR_USER_NOT_FOUND': 'The email is not registered. Need an account?',
   'ERROR_TOO_MANY_REQUESTS': 'We have blocked all request from this device due to unusual activities',
   'ERROR_OPERATION_NOT_ALLOWED':'Sign in method is not allowed. Please contant support',
 };

}