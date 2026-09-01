import 'package:flutter/material.dart';
import 'package:flutter_application_108/pages/first_page.dart';
import 'package:flutter_application_108/pages/home_page.dart';
import 'package:flutter_application_108/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/first-page': (context) => const FirstPage(),
        '/home-page': (context) => const HomePage(),
        '/settings-page': (context) => const SettingsPage(),
      },
    );
  }
}