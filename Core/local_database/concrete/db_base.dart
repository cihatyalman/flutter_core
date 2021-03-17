import 'package:sqflite/sqflite.dart';
import '../abstract/i_db_base.dart';

class DbBase implements IDbBase{
  Database _db;
  String _dbName;
  DbBase(this._dbName);

  @override
  Future<Database> get db async => _db ?? initializeDb(_dbName);

  @override
  Future<Database> initializeDb(String dbName) async{
    String dbPath = (await getDatabasesPath())+"/"+dbName;
    return await openDatabase(dbPath,version: 1);
  }

  @override
  Future<bool> deleteDb(Database db) async{
    try{
      await deleteDatabase(db.path);
      return true;
    }
    catch(e){
      return null;
    }
  }

  @override
  Future<bool> createTable(String createTableCode) async {
    try {
      await db.then((value) async => await value.execute(createTableCode));
      return true;
    }
    catch(e){
      return null;
    }
  }

  @override
  Future<List<Map>> getTable(String tableName) async {
    try {
      return await db.then((value) async => await value.query(tableName));
    }
    catch(e){
      return null;
    }
  }

  @override
  Future<List<Map>> getFromQuery(String queryCode) async{
    try{
      return await db.then((value) async => await value.rawQuery(queryCode));
    }
    catch(e){
      return null;
    }
  }

  @override
  Future<int> add(String tableName,Map map) async {
    try {
      return await db.then((value) async => await value.insert(tableName, map));
    }
    catch(e){
      return null;
    }
  }

  @override
  Future<int> update(String tableName,String idName,Map map) async{
    try {
      return await db.then((value) async => await value.update(tableName, map,where: "$idName=?",whereArgs: [map["$idName"]]));
    }
    catch(e){
      return null;
    }
  }

  @override
  Future<int> delete(String tableName,String idName,int id) async{
    try {
      return await db.then((value) async => await value.rawDelete("delete from $tableName where $idName=$id"));
      //return await db.then((value) async = await value.delete(tableName,where: "$idName=?",whereArgs: [$idName]));
    }
    catch(e){
      return null;
    }
  }

}