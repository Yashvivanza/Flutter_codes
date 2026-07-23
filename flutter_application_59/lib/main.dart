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
            
          ],
        ),
      ),
      drawer: Drawer(
        child:ListView( children: const[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/105328?v=4"),
            ),
            accountEmail: Text("abc@gmail.com"),
            accountName: Text("Flutter", style: TextStyle(fontWeight: FontWeight.bold),),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
  
            ListTile(
              title: Text("Menu 1 "),
               trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text("Menu 2 "),
               trailing: Icon(Icons.arrow_forward_ios),
            )
          ],
        )
      ),
      endDrawer: Drawer(
        child: ListView(
          children: const[
            ListTile(
              title: Text("Menu 3 "),
               trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text("Menu 4 "),
               trailing: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
