import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:io';

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
  File? myimagepath;

 
  Future<void> imageSelection() async {
    try {
      final imagetemp =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (imagetemp == null) return;

      final imagelocation = File(imagetemp.path);

      setState(() {
        myimagepath = imagelocation;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Failed to Select Image $e");
      }
    }
  }
  Future<void> cameraSelection() async {
  try {
    final imagetemp =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (imagetemp == null) return;

    final imagelocation = File(imagetemp.path);

    setState(() {
      myimagepath = imagelocation;
    });
  } on PlatformException catch (e) {
    if (kDebugMode) {
      print("Failed to Capture Image $e");
    }
  }
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: imageSelection,
              child: const Text("Gallery"),
            ),
            ElevatedButton(
              onPressed: cameraSelection,
              child: const Text("Camera"),
            ),
            const SizedBox(height: 20),
            myimagepath != null
                ? Image.file(myimagepath!)
                : const Text("No image selected"),
          ],
        ),
      ),
    );
  }
}