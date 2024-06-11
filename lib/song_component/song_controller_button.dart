import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mikki_music/widgets/all_color.dart';

class SongControllerButton extends StatefulWidget {
  final String songFilePath;
  // final int currentIndex;
  const SongControllerButton({
    super.key,
    required this.songFilePath,
    //required this.currentIndex
  });

  @override
  State<SongControllerButton> createState() => _SongControllerButtonState();
}

class _SongControllerButtonState extends State<SongControllerButton> {
  final player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSong();
  }

//play music
  void loadSong() async {
    await player.setFilePath(widget.songFilePath);
    player.play();
    setState(() {});
  }

  @override
  void dispose() {
    player.dispose(); // Release resources when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            // * Obx(() =>
            Slider(
              value: 0,
              //  songPlayerController.sliderValue.value.clamp(0.0,songPlayerController.sliderMaxValue.value),
              onChanged: (Value) {},
              //    (value) {
              //     songPlayerController.sliderValue.value = value;

              //     songPlayerController.changeSongSlider(Duration(seconds: value.toInt()));
              //  WidgetsBinding.instance.addPostFrameCallback((_) => songPlayerController.sliderValue.value = value);
              //   },
              min: 0,
              max: 5,
              // * songPlayerController.sliderMaxValue.value,

              inactiveColor: Colors.white,
            ),
            // )
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '5:0',
                // * '${songPlayerController.currentTime}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text("2.0",
                  // *   '${songPlayerController.totalTime}',
                  style: TextStyle(color: Colors.white))
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                // * songDataController.playPreviousSong();
              },
              child: Icon(
                Icons.fast_rewind,
                color: Colors.white,
                size: 35,
              ),
            ),
            InkWell(
              onTap: () {
                if (player.playing) {
                  player.pause();
                } else {
                  player.play();
                }
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Icon(
                  player.playing ? Icons.pause : Icons.play_arrow,
                  color: itembgcolor,
                  size: 35,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // * songDataController.playNextSong();
              },
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
