import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService {
  DatabaseReference? rootRef;
  FirebaseDatabaseService({this.rootRef});

  DatabaseReference get ref => rootRef ??= FirebaseDatabase.instance.ref();

  Future<bool?> add({
    required Map<String, dynamic> json,
    String childPath = "/",
  }) async {
    try {
      await ref.child(childPath).set(json);
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
      await ref.child(childPath).update(json);
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<DatabaseEvent?> get({String childPath = "/"}) async {
    try {
      return await ref.child(childPath).once();
    } catch (e) {
      return null;
    }
  }

  Future<bool?> delete({String childPath = "/"}) async {
    try {
      await ref.child(childPath).remove();
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
