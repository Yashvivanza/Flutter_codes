// Widget is a basic building block on flutter code
//Text is a widget , Buttons are widgets , Check boxes are widgets , Images are widgets

// Types of widgets
// (1) Stateless Widget : It is immutable and does not change its state during the widget's lifecycle. Example: Text, Icon, Image, etc. - does not have setState().
// (2) Stateful Widget : It is mutable and can change its state during the widget's lifecycle. Example: Checkbox, Radio, Slider, etc. - it has setState().

// State defines the current properties of the Widget.

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
            const Text(
              'Demo',
            ),
            ElevatedButton(onPressed: () {}, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
} 