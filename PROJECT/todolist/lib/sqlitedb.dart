import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todolist/todo.dart';

class SqliteDatebase {
  late Database database;
  final String dbFile = 'todo.sqlite3';
  final String tableName = 'Todo';
  final String idField = 'id';
  final String titleField = 'title';
  final String detailField = 'detail';
  final String statusField = 'status';

  Future initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), dbFile),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE $tableName(
              $idField INTEGER PRIMARY KEY AUTOINCREMENT,
              $titleField TEXT,
              $detailField TEXT,
              $statusField INTERGER
            )
          ''');
      },
    );
  }

  // create
  Future createTodo(Todo todo) async {
    await initDatabase();
    return await database.insert(tableName, todo.toMap());
  }

  // read
  Future readTodo() async {
    await initDatabase();
    final List<Map<String, dynamic>> maps = await database.query(tableName);
    return List.generate(maps.length, (i) {
      return Todo(
          id: maps[i][idField],
          title: maps[i][titleField],
          detail: maps[i][detailField],
          status: maps[i][statusField] == 1);
    });
  }

  // update
  Future updateTodo(Todo todo) async {
    await initDatabase();
    return await database
        .update(tableName, todo.toMap(), where: "id = ?", whereArgs: [todo.id]);
  }

  // delete
  Future deleteTodo(int id) async {
    await initDatabase();
    return await database.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}
