import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'add_student_screen.dart';

class StudentListScreen
    extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() =>
      _StudentListScreenState();
}

class _StudentListScreenState
    extends State<StudentListScreen> {
  final DBHelper dbHelper = DBHelper();

  List<Map<String, dynamic>> students =
      [];

  List<Map<String, dynamic>>
      filteredStudents = [];

  final searchController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future<void> loadStudents() async {
    students =
        await dbHelper.getStudents();

    filteredStudents =
        List.from(students);

    setState(() {});
  }

  void searchStudent(String value) {
    filteredStudents = students
        .where(
          (e) => e['name']
              .toString()
              .toLowerCase()
              .contains(
                value.toLowerCase(),
              ),
        )
        .toList();

    setState(() {});
  }

  Future<void> deleteStudent(
      int id) async {
    bool? result =
        await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Delete Student",
        ),
        content: const Text(
          "Are you sure?",
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pop(
              context,
              false,
            ),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pop(
              context,
              true,
            ),
            child: const Text("Yes"),
          ),
        ],
      ),
    );

    if (result == true) {
      await dbHelper.deleteStudent(id);
      loadStudents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Student Management"),
        backgroundColor: Colors.blue,
      ),

      floatingActionButton:
          FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          bool? result =
              await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const AddStudentScreen(),
            ),
          );

          if (result == true) {
            loadStudents();
          }
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 10),

            TextField(
              controller:
                  searchController,
              onChanged:
                  searchStudent,
              decoration:
                  const InputDecoration(
                hintText:
                    "Search Student",
                prefixIcon:
                    Icon(Icons.search),
                border:
                    OutlineInputBorder(),
              ),
            ),
            
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount:
                    filteredStudents.length,
                itemBuilder:
                    (context, index) {
                  final student =
                      filteredStudents[
                          index];

                  return Card(
                    elevation: 4,
                    child: ListTile(
                      leading:
                          CircleAvatar(
                        child: Text(
                          student['name'][0],
                        ),
                      ),

                      title: Text(
                        student['name'],
                      ),

                      subtitle: Text(
                        "${student['rollNo']} • ${student['department']} \n${student['email']}",
                      ),

                      trailing: Row(
                        mainAxisSize:
                            MainAxisSize.min,
                        children: [
                          IconButton(
                            icon:
                                const Icon(
                              Icons.edit,
                              color:
                                  Colors.blue,
                            ),
                            onPressed:
                                () async {
                              bool? result =
                                  await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) =>
                                          AddStudentScreen(
                                    student:
                                        student,
                                  ),
                                ),
                              );

                              if (result ==
                                  true) {
                                loadStudents();
                              }
                            },
                          ),
                          IconButton(
                            icon:
                                const Icon(
                              Icons.delete,
                              color:
                                  Colors.red,
                            ),
                            onPressed:
                                () =>
                                    deleteStudent(
                              student['id'],
                            ),
                          ),
                        ],
                      ),
                    ),                    
                  );
                },
              ),
            ),
            Text(
              "Total Students: ${students.length}",
              style:
                  const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}