import 'package:flutter/material.dart';
import 'dart:async';

// OTP Example
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
      bool isLoading = false;
      void _startTimer() {
        _counter = 10;
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_counter == 0) 
        {
          _timer.cancel();
          setState(() {
          isLoading = true;
          });
        } 
        else {
        setState(() {
        _counter--;
        isLoading = false;
      });
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

            ElevatedButton(onPressed: () {
            _startTimer();
            },child: const Text("Send OTP")),
            
            Visibility(
            visible: isLoading,
            child: ElevatedButton(
            onPressed: () {
            _startTimer();
            },
            child: const Text("Resend OTP"))),
          ],
        ),
      ),
    );
  }
}