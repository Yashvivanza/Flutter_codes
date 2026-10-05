import 'package:flutter/material.dart';
import 'Second.dart';
void main() {
  runApp(const MaterialApp(
    title: "App",
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txcon1 = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Route"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: txcon1,
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute(txt1: txcon1.text)));
              }, 
              child: const Text("Pass Data")),
          )
        ],
      ),
    );
  }
}