import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mikki_music/songs/song_controller_button.dart';
import 'package:mikki_music/songs/song_player_controller.dart';
import 'package:mikki_music/widgets/back_button.dart';

class PlaySongScreen extends StatelessWidget {
 
  const PlaySongScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController =Get.put(SongPlayerController());
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
                 Obx(() =>  Text(
                    '${songPlayerController.songArtist.value}',
                       style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic
                  ),
                  ),),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child:Obx(() =>  Text(
                          '${songPlayerController.songTitle.value}', 
                          maxLines: 1,
                           style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                     fontStyle: FontStyle.italic
                  ),
                        ),)
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
