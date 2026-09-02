import 'package:flutter/material.dart';


void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
     body: Center(
       child: Text("Profile Page"),
     ),
    );
  }
}
