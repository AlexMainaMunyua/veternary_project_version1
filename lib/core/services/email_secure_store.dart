import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';


// used to store and retrive the user email address
class EmailSecureStore{
  EmailSecureStore({@required this.flutterSecureStorage}): assert(flutterSecureStorage != null);
  final FlutterSecureStorage flutterSecureStorage;

  static const String StorageUserEmailAddressKey ='userEmailAddress';

  //email
  Future<void> setEmail(String email)async{
    await flutterSecureStorage.write(key: StorageUserEmailAddressKey, value: email);
  }

  Future<void> clearEmail()async{
    await flutterSecureStorage.delete(key: StorageUserEmailAddressKey);
  }

  Future<void> getEmail()async{
    await flutterSecureStorage.read(key: StorageUserEmailAddressKey);
  }



}