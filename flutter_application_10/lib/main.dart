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
  var message = "";
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [
           TextField(controller:txt1),
            TextField(controller:txt2),
            ElevatedButton(onPressed: () 
            {
              doSum();
            }, child: Text("Submit")),
            Text (" $message"),
          ],
        ),
      ),
    );
  }
  void doSum()
  {
    var a = int.parse(txt1.text);
    var b = int.parse(txt2.text);
    var c = a + b;
    var d = a - b;
    var e = a * b;
    var f = a / b;
    setState((){
      message = "Addition is $c";
      message += "\nSubtraction is $d";
      message += "\nMultiplication is $e";
      message += "\nDivision is $f";
    });
  }
}
