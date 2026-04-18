import 'package:flutter/material.dart';

// Radio boxes using text Male and Female seperately
// and when we click on the button it should show the text below the button.

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
  String? _isreult;
  
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
            RadioListTile(
              value: "Male",
              groupValue: _isreult,
              title: const Text("Male"),
              tileColor: const Color.fromARGB(255, 255, 204, 74),
              subtitle: const Text("Gender"),
              activeColor: const Color.fromARGB(255, 93, 0, 81),
              onChanged: (value) {
                setState(() {
                });
              },
            ),
              if (_isreult == "Male")
              const Text(
                "Male",
                style: TextStyle(fontSize: 18),
              ),

             RadioListTile(
              value: "Female",
              groupValue: _isreult,
              title: Text("Female"),
              tileColor: const Color.fromARGB(255, 255, 204, 74),
              subtitle: const Text("Gender"),
              activeColor: const Color.fromARGB(255, 93, 0, 81),
              onChanged: (value) {
                setState(() {
                  _isreult = value;
                });
              },
            ),
              if (_isreult == "Female")
                newMethod(),
          ],
        ),
      ),
    );
  }

  Text newMethod() {
    return const Text(
              "Female",
              style: TextStyle(fontSize: 18),
            );
  }
}
