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
  final TimeOfDay _timeOfDay = TimeOfDay.now();
    String? _selectedTime;
    Future<void> _show() async {
        final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
        if (result != null) {
        setState(() {
          _selectedTime = result.format(context);
        });
      }
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
           Text(
            "Current Time: ${_timeOfDay.hour}:${_timeOfDay.minute}",
            style: const TextStyle(fontSize: 24),
           ),
           Text(
            _selectedTime != null ? _selectedTime! : '',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 248, 19, 2)),
          ),
            ElevatedButton.icon(
            onPressed: () {
            _show();
            },
            icon: const Icon(Icons.punch_clock),
            label: const Text("Time")),
          ],
        ),
      ),
    );
  }
}





