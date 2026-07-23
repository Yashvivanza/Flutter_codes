import 'package:flutter/material.dart';

// First , Second and Third Route Pages.
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
      home: const MyHomePage(title: 'My First Route'),
    );
  }
}

// =================== FIRST PAGE ===================

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
            const Text('Demo'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondRoute()),
                );
              },
              child: const Text("Go to Second Route"),
            ),
          ],
        ),
      ),
    );
  }
}

// =================== SECOND PAGE ===================

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        backgroundColor: Color.fromARGB(255, 233, 156, 32),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 233, 156, 32),
                foregroundColor: Colors.white,
              ),
              child: const Text("Third Route"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ThirdRoute()),
                );
              },
            ),

            const SizedBox(height: 20),

            //  Back to First Page
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back to First Page"),
            ),
          ],
        ),
      ),
    );
  }
}

// =================== THIRD PAGE ===================

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Route'),
        backgroundColor: Color.fromARGB(255, 98, 76, 197),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color.fromARGB(255, 98, 76, 197),
            foregroundColor: Colors.white,
          ),
          child: const Text("Back"),
          onPressed: () {
            Navigator.pop(context); //  Goes to Second Page
          },
        ),
      ),
    );
  }
}