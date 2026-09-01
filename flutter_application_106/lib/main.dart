import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List names = ["Yash", "Rohit", "Saurabh"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) => 
          ListTile(
            title: Text(names[index]),
          ),
        ),
      ),
    );
  }
}