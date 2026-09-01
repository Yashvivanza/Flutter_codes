import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void userTapped() {
    print("User tapped");
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*
        ------------Grid------------
        body:GridView.builder(
          itemCount: 16,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
          itemBuilder: (context, index) =>
          Container(
            color: Colors.deepPurple,
            margin: const EdgeInsets.all(12),
          ),
      ),*/
      // ----------Stack------------

      body: Center(

          /* Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              height: 300,
              width: 300,
              color: Colors.deepPurple,
            ),
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.deepPurple[400],
          ),   */
          child: GestureDetector
          (
            onTap: userTapped,
          child: Container(
            height: 300,
            width: 300,
            color: Colors.deepPurple[200],
            child: Center(child: Text("Tap Me")),
          ),
          )
      )
      )
    );
  }
}