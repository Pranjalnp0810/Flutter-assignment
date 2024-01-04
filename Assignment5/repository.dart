import 'package:offline_database_assign/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnection? _databaseConnection;
  Database? _database;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  Future<Database?> get mydatabase async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection?.setDatabase();
      return _database;
    }
  }

  // Insert Data
  insertData(table, data) async {
    var con = await mydatabase;
    return await con!.insert(table, data);
  }

  // Get Data
  getData(table) async {
    var con = await mydatabase;
    return await con!.query("select * from myTable order by id descript");
  }

  // Update Data
  updateData(table, data) async {
    var con = await mydatabase;
    return await con!
        .update(table, data, where: "id=?", whereArgs: [data["id"]]);
  }

  // Delete Data
  deleteData(table, data) async {
    var con = await mydatabase;
    return await con!.delete(table, where: "id=?", whereArgs: [data["id"]]);
  }
}
