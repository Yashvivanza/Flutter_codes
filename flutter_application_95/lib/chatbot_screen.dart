import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'groq_service.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController controller = TextEditingController();

  final GroqService service = GroqService();

  final stt.SpeechToText speech = stt.SpeechToText();

  List<Map<String, String>> messages = [];

  bool loading = false;

  bool isListening = false;

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  Future<void> initSpeech() async {
    await speech.initialize();
  }

  Future<void> startListening() async {
    bool available = await speech.initialize();

    if (available) {
      setState(() {
        isListening = true;
      });

      speech.listen(
        onResult: (result) {
          setState(() {
            controller.text = result.recognizedWords;
            controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length),
            );
          });
        },
      );
    }
  }

  Future<void> stopListening() async {
    await speech.stop();

    setState(() {
      isListening = false;
    });
  }

  Future<void> sendMessage() async {
    String text = controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      messages.add({
        "role": "user",
        "text": text,
      });

      controller.clear();
      loading = true;
    });

    try {
      String reply = await service.sendMessage(text);

      setState(() {
        messages.add({
          "role": "bot",
          "text": reply,
        });
      });
    } catch (e) {
      setState(() {
        messages.add({
          "role": "bot",
          "text": "Error: $e",
        });
      });
    }

    setState(() {
      loading = false;
    });
  }

  Widget chatBubble(String text, bool user) {
    return Align(
      alignment:
          user ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 10,
        ),
        padding: const EdgeInsets.all(14),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: user
              ? const Color(0xffB9DCFF)
              : Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
            )
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Book My Vendor AI",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  bool user =
                      messages[index]["role"] == "user";

                  return chatBubble(
                    messages[index]["text"]!,
                    user,
                  );
                },
              ),
            ),

            if (loading)
              const Padding(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(),
              ),

            Container(
              padding: const EdgeInsets.fromLTRB(
                12,
                10,
                12,
                20,
              ),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText:
                            "Ask about Book My Vendor...",
                        filled: true,
                        fillColor:
                            const Color(0xffF2F4F7),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  CircleAvatar(
                    backgroundColor: isListening
                        ? Colors.red
                        : Colors.blue,
                    child: IconButton(
                      icon: Icon(
                        isListening
                            ? Icons.mic
                            : Icons.mic_none,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (isListening) {
                          stopListening();
                        } else {
                          startListening();
                        }
                      },
                    ),
                  ),

                  const SizedBox(width: 8),

                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}