import 'package:flutter/material.dart';
import 'package:mikki_music/db/functions/recent_song_func.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/songs/song_controller_button.dart';
import 'package:mikki_music/widgets/back_button.dart';

class PlaySongScreen extends StatefulWidget {
  final Music musicObj;
  final int index;
  const PlaySongScreen({
    super.key, required this.musicObj, required this.index,
  });

  @override
  State<PlaySongScreen> createState() => _PlaySongScreenState();
}

class _PlaySongScreenState extends State<PlaySongScreen> {
  late Music musicObjChange;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    musicObjChange =widget.musicObj;

    //add to recent playlist
    RecentlyFunctions.addToRecentlyPlayed(musicObjChange);
  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: backButton(),
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
                  const Spacer(),
                  Text('songArtist : unknown',style: TextStyle(color: Colors.white,fontSize: 14,  fontStyle: FontStyle.italic)),
                 
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Flexible(child: Text(widget.musicObj.title,style: TextStyle(color: Colors.white,fontSize: 14,  fontStyle: FontStyle.italic))),
                     
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ],
                  ),
                 SongControllerButton(songFilePath: widget.musicObj.path,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
