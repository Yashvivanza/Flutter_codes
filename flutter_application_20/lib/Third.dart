import 'package:flutter/material.dart';

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third')),
      body: const Center(child: Text('Third page')),
    );
  }
}