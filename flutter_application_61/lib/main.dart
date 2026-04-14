import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int _counter = 0;
  String myText="";
   void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = ((prefs.getInt('counter') ?? 0) + 1);
      prefs.setInt('counter', _counter);
    });
  }
  void load_Counter() async {
    SharedPreferences pref = await 
SharedPreferences.getInstance();
    setState(() {
      _counter = (pref.getInt('counter') ?? 0);
    });
  }

  @override
    void initState() {
    super.initState();
    load_Counter();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [
             const Text("you push time:"),
              Text('$_counter'),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
          onPressed: () {
            _incrementCounter();
          },
          child: const Icon(Icons.add),
        ),
    );
  }
  void _SaveData() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', 10);
    setState(() {
    myText = "Saved";
    });
  }
void _GetData() async {
    var prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');
    setState(() {
    myText = "Get Data : $counter";
    });
  }
void _RemoveData() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('counter');
    setState(() {
    myText = "Removed";
    });
    }
  }
