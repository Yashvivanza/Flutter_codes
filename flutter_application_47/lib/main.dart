import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MyApp',colors: Colors.blue,) 
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.colors});
  final String title;
  final MaterialColor colors;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(widget.title), backgroundColor: widget.colors),
    body: ListView(
      children: [
        // ListTile(1)
          ListTile(
          title: const Text("One"),
          leading: const Icon(Icons.looks_one_outlined),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          onTap:()
          {
            print("One Clicked");
          },
          ),

          // ListTile(2)
          ListTile(
          title: const Text("Two"),
          leading: const Icon(Icons.looks_two_outlined),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          onTap:()
          {
            print("Two Clicked");
          } ,
          ),

             // ListTile(3)
          ListTile(
          title: const Text("Three"),
          leading: const Icon(Icons.looks_3_outlined),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),

        // ListTile(4)
          ListTile(
          title: const Text("Sun"),
          leading: const Icon(Icons.wb_sunny),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          onTap:()
          {
            print("Three Clicked");
          },
        ),

        // ListTile(5)
          ListTile(
          title: const Text("Moon"),
          leading: const Icon(Icons.brightness_3),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
          ),

           // ListTile(6)
          ListTile(
          title: const Text("Star"),
          leading: const Icon(Icons.star_outlined),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined), 
          ),
      ],
    ),
  );
  }
}
