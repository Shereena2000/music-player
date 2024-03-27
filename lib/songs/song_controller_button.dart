import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mikki_music/songs/song_data_controller.dart';
import 'package:mikki_music/songs/song_player_controller.dart';
import 'package:mikki_music/widgets/all_color.dart';

class SongControllerButton extends StatelessWidget {
  const SongControllerButton({super.key});

  @override
  Widget build(BuildContext context) {
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    SongDataController songDataController = Get.put(SongDataController());

    return Column(
      children: [
        Column(
          children: [
           const SizedBox(
              height: 12,
            ),
          Obx(() =>   Slider(
              value: songPlayerController.sliderValue.value.clamp(0.0,songPlayerController.sliderMaxValue.value),
              onChanged: (value) {
                songPlayerController.sliderValue.value = value;
             
                songPlayerController.changeSongSlider(Duration(seconds: value.toInt()));
             WidgetsBinding.instance.addPostFrameCallback((_) => songPlayerController.sliderValue.value = value);
              },
              min: 0,
              max: songPlayerController.sliderMaxValue.value,
           
              
              inactiveColor: Colors.white,
             
            ),)
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${songPlayerController.currentTime}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text('${songPlayerController.totalTime}',
                      style: TextStyle(color: Colors.white))
                ],
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: (){songDataController.playPreviousSong();},
              child: Icon(
                Icons.fast_rewind,
                color: Colors.white,
                size: 35,
              ),
            ),
            Obx(
              () => songPlayerController.isPlaying.value
                  ? InkWell(
                      onTap: () {
                        songPlayerController.pausePlaying();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: itembgcolor,
                          size: 35,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        songPlayerController.resumePlaying();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Icon(
                          Icons.pause,
                          color: itembgcolor,
                          size: 35,
                        ),
                      ),
                    ),
            ),
            InkWell(
              onTap: (){songDataController.playNextSong();},
              child: Icon(
                Icons.fast_forward,
                color: Colors.white,
                size: 35,
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }
}
