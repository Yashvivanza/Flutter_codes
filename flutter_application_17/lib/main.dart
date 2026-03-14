import 'package:flutter/material.dart';
 // Signup form with Name, Gender, Mobile, Email, Password, Hobby (Cricket, Travelling, Music), Age (Slider),Submit button.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Student Signup Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();

  String gender = "Male";
  String mobile = "";
  String email = "";
  String password = "";
  String passwordError = "";

  // Hobbies
  bool cricket = false;
  bool travelling = false;
  bool music = false;

  // Age
  double age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔹 Name
              const Text("Name"),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your name",
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Gender
              const Text("Gender"),
              Row(
                children: [
                  Radio<String>(
                    value: "Male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  const Text("Male"),

                  Radio<String>(
                    value: "Female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  const Text("Female"),
                ],
              ),

              const SizedBox(height: 20),

              // 🔹 Mobile
              const Text("Mobile"),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  mobile = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter mobile number",
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Email
              const Text("Email"),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your email",
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Password (min 6 chars)
              const Text("Password"),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                    if (value.length < 6) {
                      passwordError =
                          "Password must be at least 6 characters";
                    } else {
                      passwordError = "";
                    }
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter password",
                  errorText:
                      passwordError.isEmpty ? null : passwordError,
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Hobby
              const Text("Hobby"),

              CheckboxListTile(
                title: const Text("Cricket"),
                value: cricket,
                onChanged: (value) {
                  setState(() {
                    cricket = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: const Text("Travelling"),
                value: travelling,
                onChanged: (value) {
                  setState(() {
                    travelling = value!;
                  });
                },
              ),

              CheckboxListTile(
                title: const Text("Music"),
                value: music,
                onChanged: (value) {
                  setState(() {
                    music = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              // 🔹 Age Slider
              const Text("Age"),
              Slider(
                value: age,
                min: 1,
                max: 100,
                divisions: 99,
                label: age.round().toString(),
                onChanged: (value) {
                  setState(() {
                    age = value;
                  });
                },
              ),
              Text("Selected Age: ${age.round()}"),

              const SizedBox(height: 30),

              // 🔹 Submit
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (password.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Password must be at least 6 characters"),
                        ),
                      );
                      return;
                    }

                    print("Name: ${nameController.text}");
                    print("Gender: $gender");
                    print("Mobile: $mobile");
                    print("Email: $email");
                    print("Password: $password");
                    print("Age: ${age.round()}");
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}