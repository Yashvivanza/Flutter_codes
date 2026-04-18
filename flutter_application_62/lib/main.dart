import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  TextEditingController txt1 = TextEditingController();
  var myvalue  = "";
  @override
  void initState()
  {
    super.initState();
    getData();
  }
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
            TextField(
              controller: txt1,
            ),
            Text(myvalue),
            ElevatedButton(onPressed: (()
            {
             saveData();
            }), 
            child: const Text("Save")),
            ElevatedButton(onPressed: (()
            {
             getData();
            }), 
            child: const Text("Get")),
            ElevatedButton(onPressed: (()
            {
             removeData();
            }), 
            child: const Text("Remove")),
          ],
        ),
      ),
    );
  }

    void saveData() async {
      var pref = await SharedPreferences.getInstance();
      await pref.setString("mya", txt1.text);
      setState(() {
      myvalue = "Data Saved";
    });
    }
    void getData() async {
      var pref = await SharedPreferences.getInstance();
      var mydata = pref.getString("mya");
      if (mydata == null) {
      setState(() {
      myvalue = "No Data Found";
    });
    } else {
      setState(() {
      myvalue = mydata;
      });
    }
  }
    void removeData() async {
      var pref = await SharedPreferences.getInstance();
      pref.remove("mya");
      setState(() {
      myvalue = "Removed";
    });
    }
}