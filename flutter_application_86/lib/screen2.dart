import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {

  @override
  void initState() {
    super.initState();
    addStudent();
  }


String result = "";
String message = "";
bool isSuccess = false;

Future<void> addStudent() async {
  final response = await http.post(
    Uri.parse('https://akashsir.in/atproject/at-crud/student-add-api.php'),
    body: {
      'st_name': 'ABC',
      'st_gender': 'F',
      'st_email': 'acz@gmail.com',
      'st_mobileno': '9974567090',
      'st_password': '983290',
    },
  );

  final data = jsonDecode(response.body);

  setState(() {
    message = data['message'];

    isSuccess = data['flag'] == "1";
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Test"),
      ),
      body: Center(
  child: message.isEmpty
      ? const CircularProgressIndicator()
      : Container(
          width: 350,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSuccess ? Colors.green.shade50 : Colors.red.shade50,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                  color: isSuccess ? Colors.green : Colors.red,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                isSuccess ? Icons.check_circle: Icons.error,
                color: isSuccess ? Colors.green : Colors.red,
                size: 35,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isSuccess ? Colors.green.shade800 : Colors.red.shade800,
                  ),
                ),
              ),
            ],
          ),
        ),
),
    );
  }
}