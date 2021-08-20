import 'package:firebase_database/firebase_database.dart';

class IFbDatabaseBase<E> {
  // ignore: missing_return
  DatabaseReference get ref{}
  // ignore: missing_return
  Future<bool> add(E entity,[String childPath="/"]) {}
  // ignore: missing_return
  Future<DataSnapshot> get([String childPath="/"]) {}
  // ignore: missing_return
  Future<bool> delete([String childPath="/"]) {}
  // ignore: missing_return
  Future<bool> hasChild([String childPath="/"]){}

}
