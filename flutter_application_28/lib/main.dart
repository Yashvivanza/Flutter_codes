import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Date Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Date Picker Example'),
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

  DateTime currentDate = DateTime.now();

  String date1 = "";
  String date2 = "";
  String date3 = "";

  @override
  void initState() {
    super.initState();

    DateTime datetime = DateTime.now();

    date1 = DateFormat("yyyy-MM-dd").format(datetime);
    date2 = DateFormat.Hms().format(datetime);
    date3 = DateFormat.MMMMEEEEd().format(datetime);
  }

  Future<void> _selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );

    if (picked != null) {
      setState(() {
        currentDate = picked;

        date1 = DateFormat("yyyy-MM-dd").format(picked);
        date2 = DateFormat.Hms().format(picked);
        date3 = DateFormat.MMMMEEEEd().format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),

      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Date: $date1",
              style: const TextStyle(fontSize: 24),
            ),

            Text(
              "Time: $date2",
              style: const TextStyle(fontSize: 24),
            ),

            Text(
              "Readable: $date3",
              style: const TextStyle(fontSize: 24),
            ),

            const SizedBox(height: 20),

            

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                _selectDate(context);
              },
              icon: const Icon(Icons.calendar_today),
              label: const Text("Select Date"),
            ),
          ],
        ),  
      );
  }
}