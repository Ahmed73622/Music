import 'package:flutter/material.dart';
import 'package:play_music/pages/music_page.dart';
import '../data/music_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '  Music',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Sono',
          ),
        ),
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
        child: Container(
          margin: const EdgeInsets.all(8),
          child: ListView(
            children: [
              ...List.generate(MusicData().getListLinght(), (index) {
                MusicData().nextMusic();
                return music(context, index);
              })
            ],
          ),
        ),
      ),
    );
  }
}

InkWell music(context, index) {
  return InkWell(
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          MusicData().getImage(),
        ),
      ),
      title: Text(
        MusicData().getMusicName(),
      ),
      subtitle: Text(
        MusicData().getDescribtion(),
        style: const TextStyle(fontFamily: 'sono'),
      ),
      trailing: const Icon(Icons.music_note),
    ),
    onTap: () => Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return MusicPage(
          imageUrl: MusicData().music[index].imageUrl,
          name: MusicData().music[index].musicName,
        );
      },
    )),
  );
}
