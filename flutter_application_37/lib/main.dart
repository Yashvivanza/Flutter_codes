import 'package:flutter/material.dart';
import 'dart:async';

// Reverse Count Down Timer
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
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MyApp'),
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

  int _counter = 10;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [

            Text(
              '$_counter',
              style: const TextStyle(fontSize: 30),
            ),

            ElevatedButton(
              onPressed: () {
                _startTimer();
              },
              child: const Text("Start"),
            ),

            ElevatedButton(
              onPressed: () {
                _timer.cancel();
              },
              child: const Text("Pause"),
            ),

            ElevatedButton(
              onPressed: () {
                _timer.cancel();
                setState(() {
                  _counter = 10;
                });
              },
              child: const Text("Stop"),
            ),

          ],
        ),
      ),
    );
  }
}