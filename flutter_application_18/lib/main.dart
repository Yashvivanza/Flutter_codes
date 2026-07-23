import 'package:flutter/material.dart';

// onPressed
// onLongPress
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      // ✅ GLOBAL BUTTON THEME
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.amber,
            backgroundColor: Colors.black,
          ),
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Buttons in Flutter'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ✅ Button with long press (uses GLOBAL theme)
            ElevatedButton(
              
              onPressed: () {
                print("Clicked");
              },
              onLongPress: () {
                print("Long Pressed");
              },
              child: const Text("Yashvi"),
            ),

            const SizedBox(height: 10),

            // ✅ CUSTOM STYLED BUTTON (your second code)
            ElevatedButton.icon(
              
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shadowColor: Colors.red,
                textStyle: const TextStyle
                (
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,),
              ),
              onPressed: () {
                print("Clicked");
              },
              label: const Text("Save"),
              icon: const Icon(Icons.save),
            ),

            const SizedBox(height: 10),

            // ✅ Normal button (uses GLOBAL theme)
            ElevatedButton(
              onPressed: () {
                print("Clicked");
              },
              child: const Text("Button2"),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                shadowColor: const Color.fromARGB(255, 60, 54, 244),
                textStyle: const TextStyle
                (
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,),
              ),
              onPressed: () {
                print("\n");
                print("Clicked");
              },
              label: const Text("Phone"),
              icon: const Icon(Icons.call),
              
            ),
            const SizedBox(height: 10),
            OutlinedButton(
            child: const Text('YASHVI'),
            onPressed: () {
            print('Pressed');
            },
            ),
          ],
        ),
      ),
    );
  }
}