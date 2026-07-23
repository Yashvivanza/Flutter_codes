import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class GroqService {

  final String apiKey = dotenv.env['GROQ_API_KEY']!;


  Future<String> sendMessage(String message) async {


    final url = Uri.parse(
      "https://api.groq.com/openai/v1/chat/completions"
    );


    final response = await http.post(
      url,

      headers: {

        "Content-Type": "application/json",

        "Authorization":
        "Bearer $apiKey",

      },


      body: jsonEncode({

        "model":"llama-3.3-70b-versatile",

       "messages": [

          {
            "role": "system",
            "content": """
        You are the AI assistant for Book My Vendor.

        Only answer questions related to vendor booking, services, vendors, categories, ratings, reviews, and app features.

        If the question is unrelated, say:
        "I can only help you with questions related to Book My Vendor."
        """
          },


          {
            "role": "user",
            "content": message
          }

        ]

      }),

    );


    if(response.statusCode == 200){


      final data = jsonDecode(response.body);


      return data["choices"][0]["message"]["content"];


    }

    else{

      throw Exception(
        "Groq Error: ${response.body}"
      );

    }

  }

}