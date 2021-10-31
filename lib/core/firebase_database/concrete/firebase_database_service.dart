import 'package:firebase_database/firebase_database.dart';
import '../abstract/i_firebase_database_service.dart';

class FirebaseDatabaseService implements IFirebaseDatabaseService {
  DatabaseReference _rootRef;
  FirebaseDatabaseService(this._rootRef);

  @override
  DatabaseReference get ref => _rootRef;

  @override
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

  @override
  Future<DataSnapshot?> get({String childPath = "/"}) async {
    try {
      return await _rootRef.child(childPath).once();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> delete({String childPath = "/"}) async {
    try {
      await _rootRef.child(childPath).remove();
      return true;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> hasChild({String childPath = "/"}) async {
    try {
      var result = await get(childPath: childPath);
      return result?.value == null ? false : true;
    } catch (e) {
      return null;
    }
  }
}
