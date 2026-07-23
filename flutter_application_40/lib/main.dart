import 'package:flutter/material.dart';

// Snakebar task:- ake one TextField and on Button Click Check Below Condition
// Text field must have 5 character if its not there then display Show
// Error in Snakbar
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

  TextEditingController txtController = TextEditingController();

void showSnackbar(String message, Color color) 
{
  var snackbar = SnackBar(
    content: Text(message),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    width: 500,
    duration: const Duration(seconds: 5),
    action: SnackBarAction(
      label: "Undo",
      onPressed: () {
        print("Snackbar Action Called");
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
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SnackBar Demo',
              style: TextStyle(fontSize: 30),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 250,
              child: TextField(
                controller: txtController,
                decoration: const InputDecoration(
                  border:UnderlineInputBorder(),
                  labelText: ("Enter 5 characters"),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () 
              {
              String text = txtController.text;
              if (text.length != 5) {
                showSnackbar("Error: Text must contain exactly 5 characters", Colors.red);
              } 
              else{
              showSnackbar("Valid Input", Colors.green);
              }
              },
              child: const Text("Check"),
            ),
          ],
        ),
      ),
    );
  }
}