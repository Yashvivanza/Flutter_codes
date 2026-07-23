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
  String mymsg = "Flutter Demo";
  
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
              mymsg,
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(onPressed: () {
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  mymsg = "Called after 2 seconds";
                });
              });
            },
            child: const Text("2 seconds")),

            ElevatedButton(onPressed: (){
              Future.delayed(Duration(seconds: 1), () {
                setState(() {
                  mymsg = "Called after 1 second";
                });
              });
            }, child: const Text("1 second")),
          ],
        ),
      ),
    );
  }
}
