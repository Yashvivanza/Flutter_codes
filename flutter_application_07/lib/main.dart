import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home:myApp()));
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter App"), backgroundColor: Colors.cyan),
      body: Center(
  child: Column(
    children: [
      Image.network(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbAkmXjasq9AeJm2ow3LW1IpKtoSPD7H9WpQ&s",
        height: 300,
      ),
      Text("Login Screen", style: TextStyle(fontSize: 30)),
      TextField(),
      TextField(),
      SizedBox(height: 20),
      SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Click me"),
        ),
      ),
    ],
  ),
      ),
    );
  }
}

