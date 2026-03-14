import 'package:flutter/material.dart';
import 'dart:async';
 
// CLock Start Stop
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
  String mymsy = "Start Clock";
  Timer? _timer;
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
              mymsy,
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(onPressed: () {
              _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                setState(() {
                  mymsy = "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
                });
              });
            },
            child: const Text("Start")),

            ElevatedButton(onPressed: (){
              _timer?.cancel();
            }, child: const Text("Stop"))
          ],
        ),
      ),
    );
  }
}
