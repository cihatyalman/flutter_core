import 'package:sqflite/sqflite.dart';

class IDbBase{
  // ignore: missing_return
  Future<Database> get db{}
  // ignore: missing_return
  Future<Database> initializeDb(String dbName){}
  // ignore: missing_return
  Future<bool> deleteDb(Database db){}
  // ignore: missing_return
  Future<bool> createTable(String createTableCode){}
  // ignore: missing_return
  Future<List<Map>> getTable(String tableName){}
  // ignore: missing_return
  Future<List<Map>> getFromQuery(String queryCode){}
  // ignore: missing_return
  Future<int> add(String tableName,Map map){}
  // ignore: missing_return
  Future<int> update(String tableName,String idName,Map map){}
  // ignore: missing_return
  Future<int> delete(String tableName,String idName,int id){}
}