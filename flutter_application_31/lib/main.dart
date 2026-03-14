import 'package:flutter/material.dart';
import 'dart:async';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> 
{
  String time = "";
  @override
  void initState()
  {
    Timer mytimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime timenow = DateTime.now();
      
        time = "${timenow.hour}:${timenow.minute}:${timenow.second}";
        setState(() {
        }
      );
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: Scaffold(
        appBar: AppBar(title: const Text("Exceute code with Timer"),),
        body: Container(
          height: 50,
          color: Colors.blue.shade50,
          child: Center(
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            )
          )
        ),
      ),
    );
  }
}