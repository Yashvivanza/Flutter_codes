import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(mytxt1: "Yashvi", mytxt2: "Vanza"));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.mytxt1, required this.mytxt2});

  final String mytxt1;
  final String mytxt2;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SecondRoute(mytxt1: "Yashvi", mytxt2: "Vanza"),
     );
  }

}

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key, required this.mytxt1, required this.mytxt2});
  final String mytxt1;
  final String mytxt2;
  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  String get mytxt1 => widget.mytxt1;
  String get mytxt2 => widget.mytxt2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              mytxt1,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              mytxt2,
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
               child: const Text("Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        )
        ),
     );
  }
}
