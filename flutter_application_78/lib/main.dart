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
  void initState() {
    super.initState();
    getData();
  }
  var mydata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: mydata.length,
        itemBuilder: (context, index) {
          return ListTile(
          leading: CircleAvatar(
          backgroundImage: NetworkImage(mydata[index]['image']),
        ),
        title: Text(
          mydata[index]['firstName'] + " " + mydata[index]['lastName'],
        ),
        subtitle: Text(mydata[index]['email']),
        trailing: Icon(Icons.mark_email_read_outlined)
          );
        },
      ),
    );
  }
  void getData() async {
    var url = Uri.https('dummyjson.com','users');
    var response = await http.get(url);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    var jsonData = jsonDecode(response.body);
    setState(() {
      mydata = jsonData['users'];
    });
  }
}
