import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _startvalue = 20.0;
  double _endvalue = 80.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Example'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          RangeSlider(
            min: 0.0,
            max: 100.0,
            values: RangeValues(_startvalue, _endvalue),
            onChanged: ( value) {
              setState(() {
                _startvalue = value.start;
                _endvalue = value.end;
              });
            },
        
          ),
          Text("$_startvalue"),
          Text("$_endvalue"),
          
        ],
      )
    );
  }
}