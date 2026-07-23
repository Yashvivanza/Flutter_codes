import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdditionScreen(),
    );
  }
}

class AdditionScreen extends StatefulWidget {
  const AdditionScreen({super.key});

  @override
  State<AdditionScreen> createState() => _AdditionScreenState();
}

class _AdditionScreenState extends State<AdditionScreen> {
  // 1. Define controllers to capture text input
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  
  String _result = "0";

  // 2. Define the addition logic
  void _calculateSum() {
    // tryParse safely handles empty inputs or invalid characters without crashing
    double n1 = double.tryParse(_num1Controller.text) ?? 0.0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0.0;

    setState(() {
      _result = (n1 + n2).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Addition Example')),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First Input Field
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: const Text(
                  'Enter First Number',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: const Color.fromARGB(255, 219, 200, 200),
              ),
            ),
            const SizedBox(height: 16),
            
            // Second Input Field
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text(
                  'Enter Second Number',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                hintText: 'Enter a number',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 219, 200, 200),
              ),
            ),
            const SizedBox(height: 24),
            
            // Trigger Button
            ElevatedButton(
              onPressed: _calculateSum,
              child: const Text('Add Numbers'),
            ),
            const SizedBox(height: 24),
            
            // Display Result
            Text(
              'Result: $_result',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }


}
