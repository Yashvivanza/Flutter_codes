import 'package:flutter/material.dart';

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
  bool is_onoff = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
          children: [
            Switch(
             value: is_onoff,
             activeThumbColor: const Color.fromARGB(255, 199, 219, 25),
             activeTrackColor: const Color.fromARGB(255, 88, 98, 117),
             inactiveThumbColor: const Color.fromARGB(255, 199, 219, 25),
             inactiveTrackColor: const Color.fromARGB(2255, 88, 98, 117),
             onChanged: (value) {
              setState(() {
                is_onoff = !is_onoff;
              });
            }),
            Text('$is_onoff'),
          ],
        ),
      );
  }
}





