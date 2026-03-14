import 'package:flutter/material.dart';

// CheckBox true or false

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
  var cb1 = false;
  var cb2 = false;
  var cb3 = false;
  var myList = [];
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
           CheckboxListTile(
            value:cb1, 
            title: const Text('Android'),
            onChanged: (value) {
              setState(() {
                if(cb1)
                {
                  cb1 = false;
                  myList.remove("Android");
                }else{
                  cb1 = true;
                  myList.add("Android");
                }
              });
            },
          ),
          CheckboxListTile(
            value: cb2, 
            title: const Text('iOS'),
            onChanged: (value) {
              setState(() {
                if(cb2)
                {
                  cb2 = false;
                  myList.remove("iOS");
                }else{
                  cb2 = true;
                  myList.add("iOS");
                }
              });
            },
          ),    
          ],
        ),
      ),
    );
  }
}





