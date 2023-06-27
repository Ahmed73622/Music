import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPage extends StatefulWidget {
  String imageUrl;
  String name;

  MusicPage({super.key, required this.imageUrl, required this.name});

  @override
  State<MusicPage> createState() => _MusicPageState(imageUrl, name);
}

class _MusicPageState extends State<MusicPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  double value = 0;
  String imageUrl;
  String name;
  bool isPlayer = false;

  _MusicPageState(this.imageUrl, this.name);

  Duration duration_traveled = const Duration();
  Duration duration_of_song = const Duration();
  final player = AudioPlayer();
  @override
  void initState() {
    super.initState();
    player.onDurationChanged.listen((event) {
      duration_of_song = event;
    });
    player.onPositionChanged.listen((event) {
      setState(() {
        duration_traveled = event;
        if (event.inMilliseconds >= duration_of_song.inMilliseconds - 500) {
          isPlayer = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900.withOpacity(0.8),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade900.withOpacity(0.8),
              Colors.deepPurple.shade300.withOpacity(0.8),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: double.infinity),
            CircleAvatar(
              maxRadius: 150,
              backgroundImage: NetworkImage(
                imageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(name),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Center(child: Text('${duration_traveled.inSeconds}')),
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: duration_of_song.inMilliseconds.toDouble(),
                      value: duration_traveled.inMilliseconds.toDouble(),
                      onChanged: (val) {
                        player.seek(Duration(milliseconds: val.toInt()));
                      },
                    ),
                  ),
                  Center(child: Text('${duration_of_song.inSeconds}')),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous),
                ),
                IconButton(
                  onPressed: () {
                    if (isPlayer) {
                      setState(() {
                        isPlayer = false;
                      });
                      player.pause();
                    } else {
                      setState(() {
                        isPlayer = true;
                      });
                      player.play(AssetSource(name));
                    }
                  },
                  icon: isPlayer
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
