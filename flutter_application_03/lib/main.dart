import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Container(
      color: const Color.fromARGB(255, 255, 230, 0),
      child: Text
      ("Hello Flutter", style: TextStyle(fontSize: 24, color: Colors.purple)),
    ),
  ));
}