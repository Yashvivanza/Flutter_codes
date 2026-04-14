import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  // Save default data (for testing)
  void saveData() async {
    var pref = await SharedPreferences.getInstance();
    pref.setString("email", "admin@gmail.com");
    pref.setString("pass", "1234");
  }

  // Login check
  void login(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();

    String email = pref.getString("email") ?? "";
    String pass = pref.getString("pass") ?? "";

    if (emailController.text == email &&
        passController.text == pass) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Success")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Wrong Email or Password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    saveData(); // save once for demo

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => login(context),
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}