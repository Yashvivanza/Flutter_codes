import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key, required this.txt1});
  final String txt1;
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
              txt1,
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Back"),)
          ],
        ),
      ),
    );
  }
}