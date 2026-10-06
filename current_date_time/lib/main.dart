import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(datetime);
    final formattedTime = DateFormat.Hms().format(datetime);
    final formattedDay = DateFormat.MMMMEEEEd().format(datetime);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current date and time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Date: $formattedDate',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            Text(
              'Time: $formattedTime',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            Text(
              'Day: $formattedDay',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}