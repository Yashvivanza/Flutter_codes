import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

void main() {
  runApp(const WakelockExampleApp());
}

class WakelockExampleApp extends StatefulWidget {
  const WakelockExampleApp({super.key});

  @override
  State<WakelockExampleApp> createState() => _WakelockExampleAppState();
}

class _WakelockExampleAppState extends State<WakelockExampleApp> {
  bool isEnabled = false;

  Future<void> enableWakelock() async {
    await WakelockPlus.enable();
    setState(() {
      isEnabled = true;
    });
  }

  Future<void> disableWakelock() async {
    await WakelockPlus.disable();
    setState(() {
      isEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Wakelock Example"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Current Status:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                isEnabled ? "Enabled ✅" : "Disabled ❌",
                style: TextStyle(
                  fontSize: 20,
                  color: isEnabled ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: enableWakelock,
                child: const Text("Enable Wakelock"),
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: disableWakelock,
                child: const Text("Disable Wakelock"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}