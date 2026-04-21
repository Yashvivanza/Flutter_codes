import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('student.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE students(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER
          )
        ''');
      },
    );
  }

  // CREATE
  Future<int> insert(String name, int age) async {
    final db = await instance.database;
    return await db.insert('students', {'name': name, 'age': age});
  }

  // READ
  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await instance.database;
    return await db.query('students');
  }

  // UPDATE
  Future<int> update(int id, String name, int age) async {
    final db = await instance.database;
    return await db.update(
      'students',
      {'name': name, 'age': age},
      where: 'id=?',
      whereArgs: [id],
    );
  }

  // DELETE
  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      'students',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final data = await DatabaseHelper.instance.getAll();
    setState(() {
      students = data;
    });
  }

  void addStudent() async {
    await DatabaseHelper.instance.insert(
      nameController.text,
      int.parse(ageController.text),
    );
    nameController.clear();
    ageController.clear();
    fetchData();
  }

  void updateStudent(int id) async {
    await DatabaseHelper.instance.update(
      id,
      nameController.text,
      int.parse(ageController.text),
    );
    nameController.clear();
    ageController.clear();
    fetchData();
  }

  void deleteStudent(int id) async {
    await DatabaseHelper.instance.delete(id);
    fetchData();
  }

  void showDialogBox(BuildContext context, {int? id}) {
    if (id != null) {
      final student = students.firstWhere((e) => e['id'] == id);
      nameController.text = student['name'];
      ageController.text = student['age'].toString();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(id == null ? "Add Student" : "Update Student"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: ageController, decoration: InputDecoration(labelText: 'Age')),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (id == null) {
                addStudent();
              } else {
                updateStudent(id);
              }
              Navigator.pop(context);
            },
            child: Text(id == null ? "Add" : "Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite CRUD"),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text(student['name']),
            subtitle: Text("Age: ${student['age']}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => showDialogBox(context, id: student['id']),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteStudent(student['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialogBox(context),
        child: Icon(Icons.add),
      ),
    );
  }
}