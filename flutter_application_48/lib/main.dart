import 'package:flutter/material.dart';
 // (1) ListView.builder() - Click Event
 // (2) ListView.builder() - Icons
 // (3) ListView.builder() - Columns
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
      body: ListView.builder(
        scrollDirection: Axis.vertical,
      itemCount: 100,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('Number $index'),
            leading: CircleAvatar(child: Text("$index")),
            onTap: () {
              print("Clicked index $index");
            },
            trailing: const Text("Go", style: TextStyle(color: Colors.blue, fontSize: 15)),
          ),
    
        );
      },
      ),
    );
  }
}

