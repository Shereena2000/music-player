import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SongTile extends StatelessWidget {
  final String songName;
  final VoidCallback onPress;
  const SongTile({super.key,required this.songName,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  '$songName',
                  maxLines: 1, 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              
              // Icon(
              //   Icons.more_vert,
              //   color: Colors.white,
              // )
            ],
          ), 
        ),
      ),
    );
  }
}
