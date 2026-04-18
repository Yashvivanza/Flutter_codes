import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MusicPlayer(),
  ));
}

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  double volume = 1.0;

  @override
  void initState() {
    super.initState();

    // total duration
    player.onDurationChanged.listen((d) {
      setState(() => duration = d);
    });

    // current position
    player.onPositionChanged.listen((p) {
      setState(() => position = p);
    });
  }

  // ▶️ Play / Pause
  void togglePlay() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.setSource(AssetSource('audio/song.mp3'));
      await player.resume();
    }
    setState(() => isPlaying = !isPlaying);
  }

  // ⏱ Format Time
  String formatTime(Duration d) {
    return "${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

      
          Container(color: const Color.fromARGB(255, 175, 139, 183)),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa6empHRkJ3BYaDUa5yGGJY4tTNjewEdIdXBIHTM-CJQ&s",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // 🎚️ Seekbar
              Center(
              child: SizedBox(
                width: 250,
              child: Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds
                    .toDouble()
                    .clamp(0, duration.inSeconds.toDouble()),
                activeColor: const Color.fromARGB(255, 227, 142, 57),
                onChanged: (value) async {
                  await player.seek(Duration(seconds: value.toInt()));
                },
              ),
              ),
              ),
              // ⏱ Time
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 410),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position),
                        style: TextStyle(color: Colors.white)),
                    Text(formatTime(duration),
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // 🎵 Title
              Text(
                "Dooron Dooron",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),

              Text(
                "Paresh Pahuja",
                style: TextStyle(color: const Color.fromARGB(255, 204, 194, 194)),
              ),

              SizedBox(height: 30),

              // ▶️ Play / Pause Button
              CircleAvatar(
                radius: 35,
                backgroundColor: const Color.fromARGB(255, 227, 142, 57),
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: togglePlay,
                ),
              ),

              SizedBox(height: 30),

              // 🔊 Volume Control
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 370),
                child: Row(
                  children: [
                    Icon(Icons.volume_down, color: Colors.white),
                    Expanded(
                      child: Slider(
                        value: volume,
                        min: 0,
                        max: 1,
                        activeColor: const Color.fromARGB(255, 227, 142, 57),
                        onChanged: (value) {
                          setState(() {
                            volume = value;
                            player.setVolume(volume);
                          });
                        },
                      ),
                    ),
                    Icon(Icons.volume_up, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}