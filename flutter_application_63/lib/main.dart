import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Create Signup Screen and Store Various Data in Sharedpref. Like 
//Name,Email,Password and Mobile No
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
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();

  String message = "";
  void saveData() async {
    var pref = await SharedPreferences.getInstance();

    await pref.setString("name", name.text);
    await pref.setString("email", email.text);
    await pref.setString("password", password.text);
    await pref.setString("mobile", mobile.text);

    setState(() {
      message = "Signup Data Saved";
    });
  }

  void getData() async {
    var pref = await SharedPreferences.getInstance();

    setState(() {
      name.text = pref.getString("name") ?? "";
      email.text = pref.getString("email") ?? "";
      password.text = pref.getString("password") ?? "";
      mobile.text = pref.getString("mobile") ?? "";
      message = "Data Loaded";
    });
  }

    void clearData() async {
    var pref = await SharedPreferences.getInstance();

    await pref.clear();

    setState(() {
      name.clear();
      email.clear();
      password.clear();
      mobile.clear();
      message = "Data Cleared";
    });
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
              controller: name,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            TextField(
              controller: mobile,
              decoration: const InputDecoration(labelText: "Mobile No"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),

            Text(message),
            ElevatedButton(
              onPressed: saveData,
              child: const Text("Signup"),
            ),
            ElevatedButton(
              onPressed: getData,
              child: const Text("Load Data"),
            ),
            ElevatedButton(
              onPressed: clearData,
              child: const Text("Clear Data"),
            ),
          ],
        ),
      ),
    );
  }
}
