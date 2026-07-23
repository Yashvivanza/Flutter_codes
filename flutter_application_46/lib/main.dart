import 'package:flutter/material.dart';
// List View

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
    return ListView(
      padding: const EdgeInsets.all(1),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.orange[700],
          child: const Center(child: Text('Entry A')),
        ),
        Container( 
          height: 50,
          color:  Colors.orange[400],
          child: const Center(child: Text('Entry B')),
        )
      ],
    );
  }
}

