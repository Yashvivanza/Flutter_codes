import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async{
    final DateTime? pickedDate = await showDatePicker(
      context: context, 
      firstDate: DateTime(2022), 
      lastDate: DateTime(2057));
      if(pickedDate != null && pickedDate != currentDate)
      {
        setState(() {
          currentDate = pickedDate;
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Text(
            currentDate.toString(),
            style: const TextStyle(fontSize: 30),
            
          ),
          ElevatedButton.icon(
            onPressed: () {
              _selectDate(context);
            },
            icon: const Icon(Icons.calendar_month),
            label: const Text("Date"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
