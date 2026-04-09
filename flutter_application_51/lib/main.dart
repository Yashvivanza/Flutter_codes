import 'package:flutter/material.dart';

// List Generate 

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
      home: const MyHomePage(title: 'MyApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
     final List<String> items = <String>['Hello','Good Morning','Lecture will start at 9 am' , 'How are you?' ];
     return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading:const CircleAvatar(
              backgroundImage:NetworkImage('data:image/png;base64,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'),
            ),
            title: Text('${items[index]}'),
            subtitle: const Text("Whatsapp"),
          ),

        );
       },
      );
  }
}
