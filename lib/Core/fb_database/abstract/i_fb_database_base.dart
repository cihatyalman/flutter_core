import 'package:firebase_database/firebase_database.dart';

class IFbDatabaseBase<E> {
  DatabaseReference? get ref{}
  Future<bool?>? add(E entity,[String childPath="/"]) {}
  Future<DataSnapshot?>? get([String childPath="/"]) {}
  Future<bool?>? delete([String childPath="/"]) {}
  Future<bool?>? hasChild([String childPath="/"]){}

}
