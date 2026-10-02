import 'package:flutter/cupertino.dart';
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
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visibility Widget'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Visibility(
            visible: isVisible,
            child: CupertinoActivityIndicator(
              animating: isVisible,
              radius: 30,
            ),
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                isVisible = true;
              });
            }, 
            child: const Text('Start')),
            const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              setState(() {
                isVisible = false;
              });
            }, 
            child: const Text('Stop'))
        ],
      )
    );
  }
}