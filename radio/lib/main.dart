import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
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
  var _result = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              RadioListTile(
                value: "Male", 
                groupValue: _result, 
                toggleable: true,
                subtitle: Text("Gender"),
                title: const Text("Male"),
                onChanged: (value)=>
                {
                  setState(() {
                    _result = "Male";
                  })
                }),
              
                RadioListTile(
                value: "Female", 
                groupValue: _result, 
                toggleable: true,
                title: const Text("Female"),
                subtitle: Text("Gender"),
                onChanged: (value)=>
                {
                  setState(() {
                    _result = "Female";
                  })
                }),
                Text(_result == "Male" ? "Male" : "Female"),
            ],
          ),
        ),
      );
  }
}