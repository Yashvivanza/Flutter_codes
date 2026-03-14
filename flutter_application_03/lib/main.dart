import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Container(
      child: Text
      ("Hello Flutter", style: TextStyle(fontSize: 24, color: Colors.purple)),
      color: const Color.fromARGB(255, 255, 230, 0),
    ),
  ));
}