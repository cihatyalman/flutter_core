import 'package:sqflite/sqflite.dart';

abstract class ILocalDatabaseService {
  Future<Database>? get db {
    return null;
  }
  Future<Database>? initializeDb(String dbName) {
    return null;
  }
  Future<bool?>? deleteDb(Database db) {
    return null;
  }
  Future<bool?>? createTable(String code) {
    return null;
  }
  Future<List<Map>?>? getTable(String tableName) {
    return null;
  }
  Future<List<Map>?>? getFromQuery(String code) {
    return null;
  }
  Future<int?>? insert(String code) {
    return null;
  }
  Future<int?>? update(String code) {
    return null;
  }
  Future<int?>? delete(String code) {
    return null;
  }
}
