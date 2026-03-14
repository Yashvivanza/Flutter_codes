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
  // USING FUNCTION
  void showSnackbar(String message)
  {
    var snackbar =  SnackBar(
      content:Text(message),
      backgroundColor: Colors.deepOrange,
      behavior: SnackBarBehavior.floating,
      width: 500,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          print("SnakceBar Action Called");
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
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
              'SnakeBar Demo',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(onPressed: () 
            {
              // var snackbar =  const SnackBar(content:Text("Hello World"));
              // ScaffoldMessenger.of(context).showSnackBar(snackbar);
              showSnackbar("Flutter Demo");
            }, 
            child: Text("Click")),
          ],
        ),
      ),
    );
  }
}
