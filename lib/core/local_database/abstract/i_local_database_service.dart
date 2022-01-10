import 'package:sqflite/sqflite.dart';

abstract class ILocalDatabaseService {
  Future<Database>? get db {}
  Future<Database>? initializeDb(String dbName) {}
  Future<bool?>? deleteDb(Database db) {}
  Future<bool?>? createTable(String code) {}
  Future<List<Map>?>? getTable(String tableName) {}
  Future<List<Map>?>? getFromQuery(String code) {}
  Future<int?>? insert(String code) {}
  Future<int?>? update(String code) {}
  Future<int?>? delete(String code) {}
}
