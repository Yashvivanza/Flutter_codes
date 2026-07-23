import 'package:flutter/material.dart';
import 'second.dart';

void main() {
  runApp(const MaterialApp(
    title: "App",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SecondRoute(
                  mytxt1: 'Yashvi',
                  mytxt2: 'Vanza',
                ),
              ),
            );
          },
          child: const Text("Go to Second Page"),
        ),
      ),
    );
  }
}