import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<_MyHomePageState> homeKey = GlobalKey<_MyHomePageState>();

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
      home: MyHomePage(key: homeKey, title: 'Flutter Demo'),
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
  String myText = "";

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
              "Shared Prefernces Demo",
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                _SaveData();
              },
              child: const Text("Save"),
            ),
            ElevatedButton(
              onPressed: () {
                _GetData();
              },
              child: const Text("Get"),
            ),
            ElevatedButton(
              onPressed: () {
                _RemoveData();
              },
              child: const Text("Remove"),
            ),
            Text(
              myText,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}



void _SaveData() async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.setInt('counter', 20);

  homeKey.currentState?.setState(() {
    homeKey.currentState!.myText = "Saved";
  });
}

void _GetData() async {
  var prefs = await SharedPreferences.getInstance();
  final int? counter = prefs.getInt('counter');

  
  homeKey.currentState?.setState(() {
    homeKey.currentState!.myText = "Get Data : $counter";
  });
}

void _RemoveData() async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.remove('counter');

  homeKey.currentState?.setState(() {
    homeKey.currentState!.myText = "Removed";
  });
}