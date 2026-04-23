import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Future Demo")),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<String>? myFuture;

  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 5));
    return "Future Data...";
  }

  @override
  void initState() {
    super.initState();
    myFuture = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: myFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Text(
            snapshot.data!,
            style: const TextStyle(fontSize: 24),
          ),
        );
      },
    );
  }
}