import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService {
  final DatabaseReference _rootRef;
  FirebaseDatabaseService(this._rootRef);

  DatabaseReference get ref => _rootRef;

  Future<bool?> add({
    required Map<String, dynamic> json,
    String childPath = "/",
  }) async {
    try {
      await _rootRef.child(childPath).set(json);
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> update({
    required Map<String, dynamic> json,
    String childPath = "/",
  }) async {
    try {
      await _rootRef.child(childPath).update(json);
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<DatabaseEvent?> get({String childPath = "/"}) async {
    try {
      return await _rootRef.child(childPath).once();
    } catch (e) {
      return null;
    }
  }

  Future<bool?> delete({String childPath = "/"}) async {
    try {
      await _rootRef.child(childPath).remove();
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> hasChild({String childPath = "/"}) async {
    try {
      var result = await get(childPath: childPath);
      return result?.snapshot.value == null ? false : true;
    } catch (e) {
      return null;
    }
  }
}
