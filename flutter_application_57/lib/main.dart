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
      home: const MyHomePage(title: 'Image GridView'),
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
  List<String> myimagesList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFzhsnlVVQ1PCnMjdoBqFtQJILUpyPKVEGqg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFzhsnlVVQ1PCnMjdoBqFtQJILUpyPKVEGqg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFzhsnlVVQ1PCnMjdoBqFtQJILUpyPKVEGqg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFzhsnlVVQ1PCnMjdoBqFtQJILUpyPKVEGqg&s"
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
    body: Container(
      child: GridView.builder(
        
        itemCount: myimagesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 400,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Image.network(myimagesList[index], fit: BoxFit.cover),
              Text("Image $index",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          );
        },
      ),
    ),
    );
  }
}


