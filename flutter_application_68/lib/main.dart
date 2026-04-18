
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MyApp'),
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
  String myAudioFilePath = "audio/song.mp3";
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool audioPlayed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
              ElevatedButton.icon(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                label: Text(isPlaying ? "Pause" : "Play"),
                onPressed: () async{
                  if(!isPlaying && !audioPlayed){
                    await audioPlayer.play(AssetSource(myAudioFilePath));
                    setState(() {
                      isPlaying = true;
                      audioPlayed = true;
                    });
                  }else if (audioPlayed && !isPlaying){
                    await audioPlayer.resume();
                    setState(() {
                      isPlaying = true;
                      audioPlayed = true;
                  });
                } else {
                  await audioPlayer.pause();
                  setState(() {
                    isPlaying = false;
                  });
                }
                },
                onLongPress: () async {
                  await audioPlayer.stop();
                  setState(() {
                    isPlaying = true;
                    audioPlayed = true;
                  });
                },
              )
          ],
        ),
      ),
    );
  }
}
