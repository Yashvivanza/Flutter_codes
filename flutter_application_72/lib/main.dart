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
  String mymsg = "Future Demo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          Text(
            mymsg,
            style: const TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () {
                Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    mymsg = "Called After 2 Seconds";
                  });
                });
              },
              child: const Text("2 Seconds")),
          ElevatedButton(
              onPressed: () {
                Future.delayed(Duration(minutes: 1), () {
                  setState(() {
                    mymsg = "Called After 1 Minute";
                  });
                });
              },
              child: const Text("1 Minute"))
        ]),
      ),
    );
  }
}
