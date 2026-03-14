import 'package:flutter/material.dart';

void main()
{
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title:Text("This is my first app"), backgroundColor: Colors.cyan,),
        body: Column(
          children:[
            Text("Dart",style:TextStyle(fontSize: 25, color: Colors.blueAccent),),
            Text("Flutter",style:TextStyle(fontSize: 25, color: Colors.green),),
          ]
        ),
      ),
    );
  }
}
