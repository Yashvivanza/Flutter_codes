import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp(mytxt1: '', mytxt2: '', mytxt3: '', mytxt4: '', mytxt5: ''));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.mytxt1, required this.mytxt2, required this.mytxt3, required this.mytxt4, required this.mytxt5});
  final String mytxt1;
  final String mytxt2;
  final String mytxt3;
  final String mytxt4;
  final String mytxt5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SecondRoute(title: 'Registration Form', mytxt1: mytxt1, mytxt2: mytxt2, mytxt3: mytxt3, mytxt4: mytxt4, mytxt5: mytxt5),
    );
  }
}
class SecondRoute extends StatefulWidget{
  const SecondRoute({super.key, required this.title, required this.mytxt1, required this.mytxt2, required this.mytxt3, required this.mytxt4, required this.mytxt5});
  final String title;
  final String mytxt1;
  final String mytxt2;
  final String mytxt3;
  final String mytxt4;
  final String mytxt5;

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}
class _SecondRouteState extends State<SecondRoute>{
  String get mytxt1 => widget.mytxt1;
  String get mytxt2 => widget.mytxt2;
  String get mytxt3 => widget.mytxt3;
  String get mytxt4 => widget.mytxt4;
  String get mytxt5 => widget.mytxt5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $mytxt1'),
            const SizedBox(height: 8),
            Text('Mobile: $mytxt2'),
            const SizedBox(height: 8),
            Text('Email: $mytxt3'),
            const SizedBox(height: 8),
            Text('Password: $mytxt4'),
            const SizedBox(height: 8),
            Text('Confirm Password: $mytxt5'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            
              child: const Text("Back",style: TextStyle(fontSize: 17)),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}