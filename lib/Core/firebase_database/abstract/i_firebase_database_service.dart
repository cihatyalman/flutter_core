import 'package:firebase_database/firebase_database.dart';

class IFirebaseDatabaseService {
  DatabaseReference? get ref {}
  Future<bool?>? add({required Map<String, dynamic> json, String childPath = "/"}) {}
  Future<DataSnapshot?>? get({String childPath = "/"}) {}
  Future<bool?>? delete({String childPath = "/"}) {}
  Future<bool?>? hasChild({String childPath = "/"}) {}
}
