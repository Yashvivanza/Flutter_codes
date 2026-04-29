import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
        scaffoldBackgroundColor: Color.fromARGB(255, 251, 219, 219)
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
  var datalist = [];
  @override
  void initState(){
    _fetchData();
    super.initState();
  }
  _fetchData() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    var data = jsonDecode(response.body);
    setState(() {
      datalist = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: datalist.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(datalist[index]['image'].toString()),
              backgroundColor: Colors.transparent,
            ),
            title: Text(datalist[index]['title'].toString()),
            subtitle: Text("${datalist[index]['category'].toString()}  \n\$${datalist[index]['price'].toString()}"),
            trailing: Icon(Icons.shopping_cart_outlined),
          );
        },
      ),
    );
  }
}
