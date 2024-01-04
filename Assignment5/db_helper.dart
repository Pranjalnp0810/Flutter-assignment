import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var mydirectory = await getApplicationDocumentsDirectory();
    var path = join(mydirectory.path, "db_crud1");
    var database = await openDatabase(path, version: 1, onCreate: createTable);
    return database;
  }

  Future<void> createTable(Database database, int version) async {
    String sql =
        "CREATE TABLE myTable(id integer primary key autoincrement, name text, descript text, date text, priority text)";

    await database.execute(sql);
  }
}
