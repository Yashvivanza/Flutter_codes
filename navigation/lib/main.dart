import 'package:flutter/material.dart';
import 'package:navigation/Third.dart';
import 'second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      initialRoute: "Home",
      routes: {
        "Home": (context) => const HomeScreen(),
        "Second": (context) => const SecondScreen(),
        "Third": (context) => const ThirdScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Route'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: 
            ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "Second");
              },
              child: const Text('Click to Navigate'),
            ),       
        ),
      );
  }
}

