import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var cb1 = false;
  var cb2 = false;
  var mylist = [];
  String selectedGender = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter your Name",
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: "Mobile number",
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email address",
                ),
              ),
          
              RadioListTile<String>(
                value: "Male", 
                groupValue: selectedGender,
                title: const Text("Male"), 
                onChanged: (gender){
                  if (gender == null) return;
                  setState(() {
                    selectedGender = gender;
                  });
                }),

              RadioListTile<String>(
                value: "Female", 
                groupValue: selectedGender, 
                title: const Text("Female"),
                 onChanged: (gender){
                  if (gender == null) return;
                  setState(() {
                    selectedGender = gender;
                  });
                 }),
                 Text("Selected Gender: $selectedGender"),
              CheckboxListTile(
                value: cb1, 
                title: const Text("Android"),
                onChanged: (value)=>{
                setState(() {
                  if(cb1)
                  {
                    cb1 = false;
                    mylist.remove("Android");
                  }
                  else
                  {
                    cb1 = true;
                    mylist.add("Android");
                  }
                })
              }),
              CheckboxListTile(
                value: cb2, 
                title: const Text("iOS"),
                onChanged: (value)=>{
                setState(() {
                  if(cb2)
                  {
                    cb2 = false;
                    mylist.remove("iOS");
                  }
                  else
                  {
                    cb2 = true;
                    mylist.add("iOS");
                  }
                })
              }),
              Text("$mylist"),
            ],
          ),
        ),
      );
  }
}