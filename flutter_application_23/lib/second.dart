import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  final String mytxt1;
  final String mytxt2;

  const SecondRoute({
    super.key,
    required this.mytxt1,
    required this.mytxt2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(mytxt1, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text(mytxt2, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}