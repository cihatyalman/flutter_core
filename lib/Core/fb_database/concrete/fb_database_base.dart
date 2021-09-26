import 'package:core_base/Core/entities/i_base_entity.dart';
import 'package:firebase_database/firebase_database.dart';
import '../abstract/i_fb_database_base.dart';

abstract class FbDatabaseBase implements IFbDatabaseBase<IBaseEntity> {
  DatabaseReference _rootRef;
  FbDatabaseBase(this._rootRef);

  @override
  DatabaseReference get ref => _rootRef;

  @override
  Future<bool?> add(IBaseEntity entity, [String childPath = "/"]) async {
    try {
      await _rootRef.child(childPath).set(entity.toMap());
      return true;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<DataSnapshot?> get([String childPath = "/"]) async {
    try {
      return await _rootRef.child(childPath).once();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> delete([String childPath = "/"]) async {
    try {
      await _rootRef.child(childPath).remove();
      return true;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool?> hasChild([String childPath = "/"]) async {
    try {
      var result = await get(childPath);
      return result?.value == null ? false : true;
    } catch (e) {
      return null;
    }
  }
}
