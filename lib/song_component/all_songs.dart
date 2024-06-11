import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/song_component/song_tile.dart';

class AllSongs extends StatelessWidget {

  const AllSongs({super.key});

  @override
  Widget build(BuildContext context) {
      late Box<Music> _songsBox;
    _songsBox = Hive.box<Music>('musicbox');
    final songs = _songsBox.values.toList() as List<Music>;
    if (songs.isEmpty) {
      return Center(child: Text("No songs in Device"),);
    }else{
    return  ListView.builder(
                    shrinkWrap: true, 
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      final song = songs[index];
                      return SongTile(
                        songName: song.title, musicObj: song,index: index,
                      );
                    },
                  );
    }
  }
}