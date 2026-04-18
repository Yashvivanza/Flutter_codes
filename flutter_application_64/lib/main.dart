import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: LoginPage()));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    var pref = await SharedPreferences.getInstance();
    bool isLogin = pref.getBool("isLogin") ?? false;

    if (isLogin) {
      String email = pref.getString("email") ?? "";
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Dashboard(email: email)),
      );
    }
  }

  void register() async {
    var pref = await SharedPreferences.getInstance();
    await pref.setString("email", emailController.text);
    await pref.setString("pass", passController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Registered")),
    );
  }

  void login() async {
    var pref = await SharedPreferences.getInstance();

    if (emailController.text == pref.getString("email") &&
        passController.text == pref.getString("pass")) {

      await pref.setBool("isLogin", true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Dashboard(email: emailController.text),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Wrong Credentials")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ForgotPasswordPage()),
                );
              },
              child: Text("Forgot Password?"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: register, child: Text("Register")),
            ElevatedButton(onPressed: login, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}

// DASHBOARD 

class Dashboard extends StatelessWidget {
  final String email;

  const Dashboard({super.key, required this.email});

  void logout(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setBool("isLogin", false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(email , style:TextStyle(color: Colors.blue)),
            

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ChangePasswordPage()),
                );
              },
              child: Text("Change Password"),
            ),

            ElevatedButton(
              onPressed: () => logout(context),
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

// CHANGE PASSWORD 

class ChangePasswordPage extends StatelessWidget {
  final old = TextEditingController();
  final newp = TextEditingController();
  final confirm = TextEditingController();

  void change(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    String pass = pref.getString("pass") ?? "";

    if (old.text != pass) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Wrong Old Password")));
    } else if (newp.text != confirm.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Passwords not match")));
    } else {
      await pref.setString("pass", newp.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password Changed")));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Password")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: old,
              decoration: InputDecoration(hintText: "Old Password"),
              obscureText: true,
            ),
            TextField(
              controller: newp,
              decoration: InputDecoration(hintText: "New Password"),
              obscureText: true,
            ),
            TextField(
              controller: confirm,
              decoration: InputDecoration(hintText: "Confirm Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => change(context),
              child: Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}
// Forget Password
class ForgotPasswordPage extends StatelessWidget {
  final emailController = TextEditingController();

  void getPassword(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();

    String savedEmail = pref.getString("email") ?? "";
    String savedPass = pref.getString("pass") ?? "";

    if (emailController.text == savedEmail) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Your Password is: $savedPass")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email not found")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "Enter Email"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => getPassword(context),
              child: Text("Get Password"),
            )
          ],
        ),
      ),
    );
  }
}