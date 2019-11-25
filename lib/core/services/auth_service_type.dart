import 'package:firebase_auth/firebase_auth.dart';
import 'package:veternary_project_version1/core/services/authentication.dart';

class FirebaseAuthService implements AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user){
    if(user == null){
      return null;
    }
    return User(
      uid:  user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl

    );
  }
  @override
  Future<void> changeEmail(String email) {
    return null;
  }

  @override
  Future<void> changePassword(String password) {
    return null;
  }

  @override
  Future<User> createUserWithEmailAndPassword(String email, String password)async {
    final AuthResult authResult = await _firebaseAuth
    .createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> deleteUser() {
    
    return null;
  }

  @override
  void dispose() {}

  @override
  Future<User> getCurrentUser() async{
    final FirebaseUser user = await _firebaseAuth.currentUser();

    return _userFromFirebase(user);
  }

  @override
  Future<bool> isEmailVerified() async {
   FirebaseUser user = await _firebaseAuth.currentUser();
   return user.isEmailVerified;
  }

  @override
  Stream<User> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);

  @override
  Future<void> sendEmailVerification() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetMail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async{
    final AuthResult authResult = await _firebaseAuth
    .signInWithCredential(EmailAuthProvider.getCredential(
      email: email,
      password: password,
    ));
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut()async {
    return  _firebaseAuth.signOut();
  }


}