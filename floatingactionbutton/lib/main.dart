import 'package:flutter/material.dart';
/* 

Diff between floatingactionbutton and floatingactionbutton.extended
FloatingActionButton does not have a label, it is just a circular button with an icon.
whereas FloatingActionButton.extended has a label and an icon, it is a rectangular button with rounded corners.

*/
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
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text('Hello, World!',
          style: TextStyle(fontSize: 40),),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          label: Text('Click'),
          backgroundColor: Colors.red,
          onPressed: (){
            print("Yes");
          },
        ),
      ),
    );
  }
}