import 'package:flutter/material.dart';
import 'db_helper.dart';

class AddStudentScreen extends StatefulWidget {
  final Map<String, dynamic>? student;

  const AddStudentScreen({
    super.key,
    this.student,
  });

  @override
  State<AddStudentScreen> createState() =>
      _AddStudentScreenState();
}

class _AddStudentScreenState
    extends State<AddStudentScreen> {
  final DBHelper dbHelper = DBHelper();

  final nameController =
      TextEditingController();

  final rollController =
      TextEditingController();

  final deptController =
      TextEditingController();

  final emailController =
      TextEditingController();

  bool isUpdate = false;

  @override
  void initState() {
    super.initState();

    if (widget.student != null) {
      isUpdate = true;

      nameController.text =
          widget.student!['name'];

      rollController.text =
          widget.student!['rollNo'];

      deptController.text =
          widget.student!['department'];

      emailController.text =
          widget.student!['email'];
    }
  }

  Future<void> saveStudent() async {
    if (nameController.text.isEmpty ||
        rollController.text.isEmpty ||
        deptController.text.isEmpty ||
        emailController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all fields",
          ),
        ),
      );
      return;
    }
    String email = emailController.text.trim();

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');

    if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Enter a valid Gmail address",
          ),
        ),
      );
      return;
    }
    Map<String, dynamic> data = {
      "name": nameController.text,
      "rollNo": rollController.text,
      "department": deptController.text,
      "email": emailController.text,
    };

    if (isUpdate) {
      await dbHelper.updateStudent(
        data,
        widget.student!['id'],
      );
    } else {
      await dbHelper.insertStudent(data); 
    }

    if (!mounted) return;

    Navigator.pop(context, true);
  }

  Widget buildField(
    String title,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          border:
              const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          isUpdate
              ? "Update Student"
              : "Add Student",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            buildField(
              "Name",
              nameController,
            ),
            buildField(
              "Roll Number",
              rollController,
            ),
            buildField(
              "Department",
              deptController,
            ),
            buildField(
              "Email",
              emailController,
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveStudent,
                child: Text(
                  isUpdate
                      ? "Update Student"
                      : "Save Student",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}