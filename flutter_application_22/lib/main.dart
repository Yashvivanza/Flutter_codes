import 'package:flutter/material.dart';
import 'Second.dart';
import 'Third.dart';
void main() => runApp(MaterialApp(
    title: "App",
    home: MyApp(),
    initialRoute: "Home",
    routes: {
    "Home": (context) => const MyApp(),
    "Second": (context) => const SecondRoute(),
    "Third": (context) => const ThirdRoute(),
    },
  )
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Route'),
        backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ElevatedButton
          (
            child: const Text("Click to Navigate"),
            onPressed: () {
              Navigator.pushNamed(context, 'Second');
            },
          ),
      ),
    );
  }
}