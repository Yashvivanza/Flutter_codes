import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'chatbot_screen.dart';


Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();


  await dotenv.load(fileName: ".env");

  if (kDebugMode) {
    debugPrint("API KEY = ${dotenv.env['GROQ_API_KEY']}");
  }
  runApp(
    const MyApp()
  );

}



class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Groq AI Chatbot",
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
        

      ),
      
      home: ChatBotScreen(),

    );

  }

}