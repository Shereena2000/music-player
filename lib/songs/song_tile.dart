import 'package:flutter/material.dart';

class SongTile extends StatelessWidget {
  final String songName;
  final VoidCallback onPress;
   // final VoidCallback addToRecentlyPlayed; 
  const SongTile({super.key, required this.songName,
  required this.onPress,
 //  required this.addToRecentlyPlayed,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: onPress,
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
          trailing: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
