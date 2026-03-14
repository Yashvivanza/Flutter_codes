import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController mathsController = TextEditingController();
  final TextEditingController englishController = TextEditingController();
  final TextEditingController scienceController = TextEditingController();

  String result = "";

  String getGrade(int marks) {
    if (marks >= 90) {
      return "Grade A";
    } else if (marks >= 80) {
      return "Grade B";
    } else if (marks >= 70) {
      return "Grade C";
    } else {
      return "Fail";
    }
  }

  void calculateResult() {
  setState(() {
    int maths = int.tryParse(mathsController.text) ?? 0;
    int english = int.tryParse(englishController.text) ?? 0;
    int science = int.tryParse(scienceController.text) ?? 0;

    String highestSubject = "";
    String lowestSubject = "";

    // Finding highest marks
    if (maths >= english && maths >= science) {
      highestSubject = "Maths";
    } else if (english >= maths && english >= science) {
      highestSubject = "English";
    } else {
      highestSubject = "Science";
    }

    // Finding lowest marks
    if (maths <= english && maths <= science) {
      lowestSubject = "Maths";
    } else if (english <= maths && english <= science) {
      lowestSubject = "English";
    } else {
      lowestSubject = "Science";
    }

    result =
    "Maths: $maths\n"
    "English: $english\n"
    "Science: $science\n\n"
    "Highest Marks: $highestSubject\n"
    "Lowest Marks: $lowestSubject";

  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Result"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: mathsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Maths Marks",
                
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: englishController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter English Marks",
              
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: scienceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Science Marks",
                
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateResult,
              child: const Text("Submit"),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
