import 'package:flutter/material.dart';


void main() {
  runApp(const SettingsPage());
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Settings Page'),
      ),
    );
  }
}
