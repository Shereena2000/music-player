import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mikki_music/songs/song_controller_button.dart';
import 'package:mikki_music/widgets/back_button.dart';

class PlaySongScreen extends StatelessWidget {
  final String songTitile;
  final String artistName;
  const PlaySongScreen({super.key, required this.songTitile, required this.artistName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  backButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background_img1.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
            
               const   Spacer(),
                  Text(
                    '$artistName',
                       style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic
                  ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '$songTitile',
                          maxLines: 1,
                           style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                     fontStyle: FontStyle.italic
                  ),
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),

                    ],
                  ),
                
                 SongControllerButton() 
                ], 
              ),
            ),
          )
        ],
      ),
    );
  }
}
