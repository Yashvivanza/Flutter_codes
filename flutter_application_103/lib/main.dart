import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Varaibles
  String name = "Flutter";
  int age = 5;
  double height = 1.75;
  bool isStudent = true;
  
  /*
  Basic Math Operators -> +, -, *, /, %
  */

  /*
  Comparision Operators -> == , != , > , < , >= , <=
  */

  /*
  Logical Operators 
  && -> both conditions must be true
  || -> either condition must be true
  */

  /*
  Control Flow
  if(condition){
    // code to execute if condition is true
  } else {
    // code to execute if condition is false
  }
  */
  @override
  Widget build(BuildContext context) {
    if( age >= 18){
      print("True");
    }
    else{
      print("False");
    }
    for (int i = 0; i < 5; i++) {
      print(i);
    }
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}