import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Registration',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StudentPage(),
    );
  }
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;


  bool validateForm() {
    if (nameController.text.isEmpty) {
      showErrorSnackBar('Please enter student name');
      return false;
    }
    if (genderController.text.isEmpty) {
      showErrorSnackBar('Please select gender');
      return false;
    }
    if (emailController.text.isEmpty) {
      showErrorSnackBar('Please enter email');
      return false;
    }
    if (!emailController.text.contains('@')) {
      showErrorSnackBar('Please enter valid email');
      return false;
    }
    if (mobileController.text.isEmpty) {
      showErrorSnackBar('Please enter mobile number');
      return false;
    }
    if (mobileController.text.length < 10) {
      showErrorSnackBar('Mobile number must be at least 10 digits');
      return false;
    }
    if (passwordController.text.isEmpty) {
      showErrorSnackBar('Please enter password');
      return false;
    }
    if (passwordController.text.length < 6) {
      showErrorSnackBar('Password must be at least 6 characters');
      return false;
    }
    return true;
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> addStudent() async {
    if (!validateForm()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      var uri = Uri.parse(
        "https://student-add-api.php",
      );

      var request = http.MultipartRequest("POST", uri);

      request.fields["st_name"] = nameController.text;
      request.fields["st_gender"] = genderController.text;
      request.fields["st_email"] = emailController.text;
      request.fields["st_mobileno"] = mobileController.text;
      request.fields["st_password"] = passwordController.text;

      var response = await request.send();

      String responseData =
          await response.stream.bytesToString();

      var jsonData = jsonDecode(responseData);

      if (response.statusCode == 200) {
        showSuccessSnackBar(jsonData["message"] ?? "Student added successfully");
        // Clear form
        nameController.clear();
        genderController.clear();
        emailController.clear();
        mobileController.clear();
        passwordController.clear();
      } else {
        showErrorSnackBar(jsonData["message"] ?? "Error adding student");
      }
    } catch (e) {
      showErrorSnackBar("Error: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  Widget buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(
              nameController,
              "Student Name",
              Icons.person,
            ),

            buildTextField(
              genderController,
              "Gender",
              Icons.people,
            ),

            buildTextField(
              emailController,
              "Email",
              Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),

            buildTextField(
              mobileController,
              "Mobile Number",
              Icons.phone,
              keyboardType: TextInputType.phone,
            ),

            buildTextField(
              passwordController,
              "Password",
              Icons.lock,
              obscureText: true,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isLoading ? null : addStudent,
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        "Add Student",
                        style: TextStyle(fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}