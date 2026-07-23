import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MusicPlayer(),
  ));
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
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

    player.onDurationChanged.listen((d) {
      setState(() => duration = d);
    });

    player.onPositionChanged.listen((p) {
      setState(() => position = p);
    });
  }

  void togglePlay() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.setSource(AssetSource('audio/song.mp3'));
      await player.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  String formatTime(Duration d) {
    return "${d.inMinutes}:${(d.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 175, 139, 183),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // ⭐ important for compact UI
            children: [

              // IMAGE (reduced size)
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa6empHRkJ3BYaDUa5yGGJY4tTNjewEdIdXBIHTM-CJQ&s",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // SEEK BAR (compact)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                
                child: SizedBox(
                  width: 220,
                  child: Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble() > 0
                        ? duration.inSeconds.toDouble()
                      : 1.0,
                  value: position.inSeconds.toDouble().clamp(
                        0,
                        duration.inSeconds.toDouble() > 0
                            ? duration.inSeconds.toDouble()
                            : 1.0,
                      ),
                  activeColor: const Color.fromARGB(255, 227, 142, 57),
                  onChanged: (value) async {
                    await player.seek(Duration(seconds: value.toInt()));
                  },
                ),
              ),
              ),
              
              // TIME
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:670),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position),
                        style: const TextStyle(color: Colors.white)),
                    Text(formatTime(duration),
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // TITLE
              const Text(
                "Dooron Dooron",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),

              const Text(
                "Paresh Pahuja",
                style: TextStyle(
                    color: Color.fromARGB(255, 220, 220, 220),
                    fontSize: 14),
              ),

              const SizedBox(height: 20),

              // PLAY BUTTON (smaller)
              CircleAvatar(
                radius: 28,
                backgroundColor: const Color.fromARGB(255, 227, 142, 57),
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 32,
                    color: Colors.white,
                  ),
                  onPressed: togglePlay,
                ),
              ),

              const SizedBox(height: 15),

              // VOLUME (compact)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 620),
                child: Row(
                  children: [
                    const Icon(Icons.volume_down, color: Colors.white),

                    SizedBox(
                      width: 240,
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
                    
                    const Icon(Icons.volume_up, color: Colors.white),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}