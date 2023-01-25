import 'package:sqflite/sqflite.dart' as sql;
import 'package:taskcontrol/models/task.dart';

class LocalDatabase {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        ischeck TEXT,
        stats TEXT
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'taskdatabase.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> insertTask(Task task) async {
    final db = await LocalDatabase.db();

    final id = await db.insert(
      'items',
      task.toMap(),
    );
    return id;
  }

  static Future<List<Task>> getTask() async {
    final db = await LocalDatabase.db();
    List<Task> list = [];
    var listTask = await db.query('items');
    for (var task in listTask) {
      list.add(Task.fromMap(task));
    }
    return list;
  }

  static Future<void> updateTask(Task task) async {
    final db = await LocalDatabase.db();
    await db.update('items', task.toMap());
  }
}
