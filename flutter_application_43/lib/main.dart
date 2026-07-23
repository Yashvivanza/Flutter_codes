import 'package:flutter/material.dart';
// addition of two numbers  using textfield , textbox
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
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  int sum = 0;

  void calculateSum() {
    int a = int.tryParse(firstNumberController.text) ?? 0;
    int b = int.tryParse(secondNumberController.text) ?? 0;

    setState(() {
      sum = a + b;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: firstNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter first number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: secondNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter second number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculateSum,
                child: const Text('Calculate Sum'),
              ),
              const SizedBox(height: 16),
              Text(
                'The Sum is: $sum',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
