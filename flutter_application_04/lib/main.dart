import 'package:flutter/material.dart';

void main()
{
  runApp(const MaterialApp(
    home: MyWidget(),
  ));
}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red[300],);
  }
}