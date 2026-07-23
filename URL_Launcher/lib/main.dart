import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "URL Launcher Demo",
    
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> makeCall() async {
    final Uri uri = Uri(scheme: 'tel', path: '9876543210');

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> sendSMS() async {
    final Uri uri = Uri(
      scheme: 'sms',
      path: '9876543210',
    );
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

 Future<void> sendEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'test@gmail.com',
    queryParameters: {
      'subject': 'Flutter Practice',
      'body': 'Hello,\n\nWelcome to Flutter URL Launcher.',
    },
  );

  await launchUrl(
    emailUri,
    mode: LaunchMode.externalApplication,
  );
}

  Future<void> openMap() async {
  final Uri mapUri = Uri.parse(
    'https://maps.google.com/?q=23.0225,72.5714',
  );

  await launchUrl(
    mapUri,
    mode: LaunchMode.externalApplication,
  );
}

 Future<void> openWebsite() async {
  final Uri url = Uri.parse(
    'https://www.akashsir.com',
  );

  await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  );
}

  Widget customButton(
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.infinity,
            55,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("URL Launcher Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            customButton(
              "Make Call",
              Icons.call,
              makeCall,
            ),
            customButton(
              "Send SMS",
              Icons.message,
              sendSMS,
            ),
            customButton(
              "Send Email",
              Icons.email,
              sendEmail,
            ),
            customButton(
              "Open Map",
              Icons.location_on,
              openMap,
            ),
            customButton(
              "Open Website",
              Icons.language,
              openWebsite,
            ),
          ],
        ),
      ),
    );
  }
}