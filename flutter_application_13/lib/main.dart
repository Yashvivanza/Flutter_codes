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
  double _startValue = 20.0;
  double _endValue = 90.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
          children: [
            RangeSlider(
              min: 0.0,
              max: 100.0,
              values: RangeValues(_startValue, _endValue),    
              onChanged:(value)
              {
                setState((){
                  _startValue = value.start;
                  _endValue = value.end;
                });
              }
            ), 
            Text("$_startValue"),
            Text("$_endValue"),
          ],
        ),
      );
  }
}





