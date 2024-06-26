import 'package:flutter/material.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/screens/play_song_screen.dart';
import 'package:mikki_music/widgets/trailing_popup.dart';

class SongTile extends StatelessWidget {
  final String songName;
  final Music musicObj;
  final int index;
 final String artistName;
  const SongTile({
    super.key,
    required this.songName,
    required this.musicObj,
    required this.index, required this.artistName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaySongScreen(
                musicObj: musicObj,
                index: index,
              ),
            ),
          );
        },
        //*onPress,
        child: ListTile(
            leading: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/music.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              width: 50.0,
              height: 50.0,
            ),
            title: Text(
              songName,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
             subtitle: Text(
              artistName ?? "Unkown",
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
               
              ),
            ),
            trailing: PopUp(
              song: musicObj,
            )),
      ),
    );
  }
}
