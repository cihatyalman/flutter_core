import 'package:sqflite/sqflite.dart';

class IDbBase {
  // ignore: missing_return
  Future<Database> get db {}
  // ignore: missing_return
  Future<Database> initializeDb(String dbName) {}
  // ignore: missing_return
  Future<bool> deleteDb(Database db) {}
  // ignore: missing_return
  Future<bool> createTable(String code) {}
  // ignore: missing_return
  Future<List<Map>> getTable(String tableName) {}
  // ignore: missing_return
  Future<List<Map>> getFromQuery(String code) {}
  // ignore: missing_return
  Future<int> insert(String code) {}
  // ignore: missing_return
  Future<int> update(String code) {}
  // ignore: missing_return
  Future<int> delete(String code) {}
}
