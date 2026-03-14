import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Digital Clock'),
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

  String mymsg = "Start Clock";
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),

      body: Container(

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff141E30),
              Color(0xff243B55),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 10,
                      offset: Offset(3, 3),
                    )
                  ],
                ),

                child: Text(
                  mymsg,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                ),
              ),

              const SizedBox(height: 40),

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

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  _timer?.cancel();
                },
                child: const Text("Stop"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}