import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const PianoPage());
  });
}

class PianoPage extends StatelessWidget {
  const PianoPage({super.key});

  void playSound(soundToPlay) {
    final player = AudioPlayer();
    player.play(AssetSource(soundToPlay));
  }

  Widget whiteTiles(String soundToPlay) {
    return Expanded(
      child: TextButton(
        child: Container(
          color: Colors.white,
        ),
        onPressed: () {
          playSound(soundToPlay);
        },
      ),
    );
  }

  Widget blackTiles(
      {String? soundToPlay, double? top, double? left, double? right}) {
    return Positioned(
      top: top, // Position the black container at the top
      left: left,
      right: right,
      height: 200, // Set the desired height for the black container
      child: Container(
        width: 60,
        color: Colors.black,
        child: TextButton(
          onPressed: () {
            if (soundToPlay != null) {
              playSound(soundToPlay);
            }
          },
          child: Text(''),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Row(
                children: [
                  whiteTiles('piano-c-major.wav'),
                  whiteTiles('piano-d-major.wav'),
                  whiteTiles('piano-e-major.wav'),
                  whiteTiles('piano-f-major.wav'),
                  whiteTiles('piano-g-major.wav'),
                  whiteTiles('piano-a-major.wav'),
                  whiteTiles('piano-b-major.wav'),
                ],
              ),
              blackTiles(
                  soundToPlay: 'piano-c#-major.wav',
                  top: 0,
                  left: 70,
                  right: 595),
              blackTiles(
                  soundToPlay: 'piano-eb-major.wav',
                  top: 0,
                  left: 175,
                  right: 490),
              blackTiles(
                  soundToPlay: 'piano-f#-major.wav',
                  top: 0,
                  left: 385,
                  right: 280),
              blackTiles(
                  soundToPlay: 'piano-g#-major.wav',
                  top: 0,
                  left: 490,
                  right: 175),
              blackTiles(
                  soundToPlay: 'piano-bb-major.wav',
                  top: 0,
                  left: 175,
                  right: 490),
              blackTiles(
                  soundToPlay: 'piano-b-major.wav',
                  top: 0,
                  left: 595,
                  right: 75),
            ],
          ),
        ),
      ),
    );
  }
}
