import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = p.join(
      await getDatabasesPath(),
      "student.db",
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE student(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          rollNo TEXT,
          department TEXT,
          email TEXT
        )
        ''');
      },
    );
  }

  Future<int> insertStudent(
      Map<String, dynamic> data) async {
    final db = await database;
    return db.insert("student", data);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await database;
    return db.query("student");
  }

  Future<int> updateStudent(
      Map<String, dynamic> data,
      int id) async {
    final db = await database;

    return db.update(
      "student",
      data,
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<int> deleteStudent(int id) async {
    final db = await database;

    return db.delete(
      "student",
      where: "id=?",
      whereArgs: [id],
    );
  }
}