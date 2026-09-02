import 'package:flutter/material.dart';


void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
     body: Center(
       child: Text("Home Page"),
     ),
    );
  }
}
