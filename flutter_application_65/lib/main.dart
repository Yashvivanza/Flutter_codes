import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: ColorPage()));
}

class ColorPage extends StatefulWidget {
  const ColorPage({super.key});

  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  Color bgColor = Colors.white;

  @override
  void initState() {
    super.initState();
    loadColor();
  }

  // Load saved color
  void loadColor() async {
    var pref = await SharedPreferences.getInstance();
    String color = pref.getString("color") ?? "white";

    setState(() {
      if (color == "red") {
        bgColor = Colors.red;
      } else if (color == "green") bgColor = Colors.green;
      else if (color == "blue") bgColor = Colors.blue;
      else bgColor = Colors.white;
    });
  }

  // Save color
  void setColor(String colorName) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setString("color", colorName);
    loadColor(); // refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Color Preference")),
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => setColor("red"),
                child: Text("Red"),
              ),
              ElevatedButton(
                onPressed: () => setColor("green"),
                child: Text("Green"),
              ),
              ElevatedButton(
                onPressed: () => setColor("blue"),
                child: Text("Blue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}