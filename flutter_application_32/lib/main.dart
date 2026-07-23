import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String time = "";

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime timenow = DateTime.now();

      int hour = timenow.hour;
      int minute = timenow.minute;
      int second = timenow.second;


      String period = "AM";
      if (hour >= 12) {
        period = "PM";
      }
      hour = hour % 12;
      if (hour == 0) {
        hour = 12;
      }

      
      String h = hour < 10 ? "0$hour" : "$hour";
      String m = minute < 10 ? "0$minute" : "$minute";
      String s = second < 10 ? "0$second" : "$second";

      time = "$h:$m:$s $period";

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Execute Code With Timer"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          height: 200,
          color: Colors.blue.shade50,
          child: Center(
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}