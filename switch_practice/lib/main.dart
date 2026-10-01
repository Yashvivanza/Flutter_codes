import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool is_onoff = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterApp'),
      ),
      body: Row(
        children: [
          Switch(
          value: is_onoff,
          activeColor: Colors.green,
          activeTrackColor: Colors.blue,
          inactiveThumbColor: Colors.amber,
          inactiveTrackColor: Colors.red,
          onChanged: (value) {
          setState(() {
          is_onoff = value;
          });
          },
          ),
            Text("$is_onoff"),
        ],
      )
    );
  }
}