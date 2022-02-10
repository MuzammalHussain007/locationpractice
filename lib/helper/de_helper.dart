import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static Future<sql.Database> databaseSql() async {
    final dbPath = await sql.getDatabasesPath();
    String query =
        "CREATE TABLE user_places(id TEXT PRIMARY KEY ,title TEXT ,image TEXT )";
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(query);
    }, version: 1);
  }

  static Future<void> insert(String tableName, Map<String, Object> data) async {
    final db = await DatabaseHelper.databaseSql();
    db.insert(tableName, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> fetchAndShow(
      String tableName) async {
    final db = await DatabaseHelper.databaseSql();
    return db.query(tableName);
  }
}
