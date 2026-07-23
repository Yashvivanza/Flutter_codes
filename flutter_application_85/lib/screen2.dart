import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List todos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/todos'),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        setState(() {
          todos = jsonData['todos'];
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Data"),
        backgroundColor: Colors.blueAccent,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        todos[index]['id'].toString(),
                      ),
                    ),
                    title: Text(
                      todos[index]['todo'],
                    ),
                    subtitle: Text(
                      "User ID: ${todos[index]['userId']}",
                    ),
                    trailing: todos[index]['completed']
                        ? const Icon(Icons.check_circle , color: Colors.green,)
                        : const Icon(Icons.cancel, color: Colors.red,),
                  ),
                );
              },
            ),
    );
  }
}