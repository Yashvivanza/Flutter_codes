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
  var num = 1;
  var message = '';
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
           Text("Start Demo"),
           Text("Value is $num"),
           Text("$message"),
            ElevatedButton(onPressed: () {
             incrementData();
            }, child: Text("+"),
            ),
            ElevatedButton(onPressed: () {
              decrementData();
            }, child: Text("-"),
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                num = 0;
                message = '';
              });
            }, child: Text("X"),
            ),
          ],
        ),
      ),
    );
  }

  void incrementData()
  {
    if(num > 5)
    {
      setState((){
        message = " Sorry > 5";
      });
    }else{
      setState((){
        num = num + 1;
        message = '';
      });
    }
  }
    void decrementData()
  {
    if(num < 0)
    {
      setState((){
        message = " Sorry < 0";
      });
    }else{
      setState(() {
        num = num - 1;
        message = '';
      });
    }
  }
}
