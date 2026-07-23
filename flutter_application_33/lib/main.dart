import 'package:flutter/material.dart';
import 'dart:async';
 // BUTTON CLICK CHANGE CONTENT AFTER 5 SECONDS
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: "Timer Example"),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String mymsg = "Hello world";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              mymsg,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Timer(const Duration(seconds: 5), () {
                  setState(() {
                    mymsg = "After Some time";
                  });
                });
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}