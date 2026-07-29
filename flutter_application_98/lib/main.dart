import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Database? database;
  List<Map<String, dynamic>> empList = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool isUpdate = false;
  int? updateId;

  @override
  void initState() {
    super.initState();
    initDB();
  }

  // INIT DB
  void initDB() async {
    String path = join(await getDatabasesPath(), 'employee.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE emp(
            empid INTEGER PRIMARY KEY AUTOINCREMENT,
            empname TEXT,
            empmobile TEXT
          )
        ''');
      },
    );

    loadData();
  }

  // INSERT
  void insertData() async {
    await database!.insert('emp', {
      'empname': nameController.text,
      'empmobile': mobileController.text,
    });

    clearFields();
    loadData();
  }

  // UPDATE
  void updateData() async {
    await database!.update(
      'emp',
      {'empname': nameController.text, 'empmobile': mobileController.text},
      where: 'empid=?',
      whereArgs: [updateId],
    );

    isUpdate = false;
    clearFields();
    loadData();
  }

  // DELETE
  void deleteData(int id) async {
    await database!.delete('emp', where: 'empid=?', whereArgs: [id]);
    loadData();
  }

  // LOAD DATA
  void loadData() async {
    final data = await database!.query('emp');
    setState(() {
      empList = data;
    });
  }

  void clearFields() {
    nameController.clear();
    mobileController.clear();
  }

  // SET DATA FOR UPDATE
  void editData(Map<String, dynamic> data) {
    nameController.text = data['empname'];
    mobileController.text = data['empmobile'];
    updateId = data['empid'];
    isUpdate = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee CRUD App')),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: mobileController,
              decoration: const InputDecoration(labelText: "Mobile"),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: isUpdate ? updateData : insertData,
              child: Text(isUpdate ? "Update Employee" : "Add Employee"),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: empList.length,
                itemBuilder: (context, index) {
                  final data = empList[index];

                  return Card(
                    child: ListTile(
                      leading: Text(data['empid'].toString()),
                      title: Text(data['empname']),
                      subtitle: Text(data['empmobile']),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => editData(data),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteData(data['empid']),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}