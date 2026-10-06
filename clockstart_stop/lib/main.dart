import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  String mymsg = "Start Clock";
  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 155, 181),
      appBar: AppBar(
        title: Text("Clock Start & Stop"),
        backgroundColor: const Color.fromARGB(255, 197, 105, 136),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mymsg,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                  setState(() {
                    mymsg =
                        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
                  });
                });
              },
              child: const Text("Start"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                _timer?.cancel();
              },
              child: const Text("Stop"),
            ),
          ],
        ),
      ),
    );
  }
}