import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/functions/add_song_to_hive.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/song_component/song_tile.dart';
import 'package:mikki_music/widgets/constant.dart';

class AllSongs extends StatefulWidget {
  const AllSongs({super.key});

  @override
  State<AllSongs> createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {
  late Box<Music> box;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box = Hive.box<Music>('musicbox');
  }

  @override
  Widget build(BuildContext context) {
    return allSongs();
  }

  Widget allSongs() {
    return ValueListenableBuilder(
        valueListenable: songsNotifier,
        builder: (context, List<Music> songs, child) {
          if (songs.isEmpty) {
            return const Center(
              child: Text('Music is Empty!!!',style: normalText,),          
            );
          }
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final Music song = songs[index];
                return SongTile(
                    songName: song.title, musicObj: song, index: index,artistName: song.artist.toString(),);
              });
        });
  }
}
