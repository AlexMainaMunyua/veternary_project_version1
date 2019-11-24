import 'package:flutter/foundation.dart';
import 'package:veternary_project_version1/constants/string.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';
import 'package:veternary_project_version1/pages/sign_in/validator.dart';

enum EmailPasswordSignInFormType {signIn, register, forgotPassword}

class EmailPasswordSignInModel with EmailAndPasswordValidators, ChangeNotifier{
  EmailPasswordSignInModel({
    @required this.auth,
    this.email = '',
    this.password = '',
    this.formType = EmailPasswordSignInFormType.signIn,
    this.isLoading = false,
    this.submitted = false,
  });
  final AuthService auth;

  String email;
  String password;
  EmailPasswordSignInFormType formType;
  bool isLoading;
  bool submitted;

  Future<bool> submit() async{
    try{
      updateWith(submitted:true);
      if(!canSubmit){
        return false;
      }
      updateWith(isLoading: true);
      switch (formType) {
        case EmailPasswordSignInFormType.signIn:
        await auth.signInWithEmailAndPassword(email, password);
        break;
        case EmailPasswordSignInFormType.register:
        await auth.createUserWithEmailAndPassword(email, password);
        break;
        case EmailPasswordSignInFormType.forgotPassword:
        await auth.sendPasswordResetMail(email);
        updateWith(isLoading: false);
               break;
              }
              return true;
            }catch(e){
              updateWith(isLoading: false);
              rethrow;
            }
          }

          void updateEmail(String email) => updateWith(email: email);

          void updatePassword(String password) => updateWith(password: password);

          void updateFormType(EmailPasswordSignInFormType formType){
            updateWith(
              email: '',
              password: '',
              formType: formType,
              isLoading: false,
              submitted: false,
            );
          }
        
          void updateWith({
            String email,
            String password,
            EmailPasswordSignInFormType formType,
            bool submitted,
            bool isLoading}) {
              this.email =email ?? this.email;
              this.password = password ?? this.password;
              this.formType = formType ?? this.formType;
              this.isLoading = isLoading ?? this.isLoading;
              this.submitted = submitted ?? this.submitted;
              notifyListeners();
            }

            String get passwordLabelText{
              if(formType == EmailPasswordSignInFormType.register){
                return Strings.password8CharactersLabel;
              }
              return Strings.passwordLabel;
            }

            String get primaryButtonText{
              return <EmailPasswordSignInFormType, String>{
                EmailPasswordSignInFormType.register: Strings.createAnAccount,
                EmailPasswordSignInFormType.signIn: Strings.signIn,
                EmailPasswordSignInFormType.forgotPassword: Strings.sendResetLink,
              }[formType];
            }

            String get secondaryButtonText{
              return <EmailPasswordSignInFormType, String>{
                EmailPasswordSignInFormType.register: Strings.haveAnAccount,
                EmailPasswordSignInFormType.signIn: Strings.needAnAccount,
                EmailPasswordSignInFormType.forgotPassword: Strings.backToSignIn,
              }[formType];
            }

            EmailPasswordSignInFormType get secondaryActionFormType{
              return <EmailPasswordSignInFormType, EmailPasswordSignInFormType>{
                EmailPasswordSignInFormType.register: EmailPasswordSignInFormType.signIn,
                EmailPasswordSignInFormType.signIn: EmailPasswordSignInFormType.register,
                EmailPasswordSignInFormType.forgotPassword:
                EmailPasswordSignInFormType.signIn,
              }[formType];
            }

            String get errorAlertTitle{
              return<EmailPasswordSignInFormType, String>{
                EmailPasswordSignInFormType.register: Strings.registrationFailed,
                EmailPasswordSignInFormType.signIn: Strings.signInFailed,
                EmailPasswordSignInFormType.forgotPassword: Strings.passwordResetfailed,
              }[formType];
            }
            bool get canSubmitEmail{
              return emailSubmitValidator.isValid(email);
            }

            bool get canSubmitPassword{
              if(formType == EmailPasswordSignInFormType.register){
                return passwordRegisterSubmitValidator.isValid(password);
              }
              return passwordRegisterSubmitValidator.isValid(password);
            }

            bool get canSubmit{
              final bool canSubmitFields =
               formType == EmailPasswordSignInFormType.forgotPassword
               ? canSubmitEmail
               : canSubmitPassword && canSubmitPassword;
               return canSubmitFields && !isLoading;
            }

            String get emailErrorText{
              final bool showErrorText =submitted && !canSubmitEmail;
              final String errorText = email.isEmpty
              ? Strings.invalidEmailEmpty
              : Strings.invalidEmailErrorText;
              return showErrorText ? errorText : null;
            }
            String get passwordErrorText{
              final bool showErrorText = submitted && !canSubmitPassword;
              final String errorText = password.isEmpty
              ? Strings.invalidPasswordEmpty
              :Strings.invalidPasswordTooShort;
              return showErrorText ? errorText : null;
            }

            @override
            String toString(){
              return 'email: $email, password: $password, formType: $formType, isLoading, $submitted';
            }
  
}