import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mikki_music/db/functions/add_song_to_hive.dart';
import 'package:mikki_music/db/functions/fvrt_function.dart';
import 'package:mikki_music/db/functions/recent_song_func.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/back_button.dart';

class PlaySongScreen extends StatefulWidget {
  final Music musicObj;
  final int index;
  const PlaySongScreen({
    super.key,
    required this.musicObj,
    required this.index,
  });

  @override
  State<PlaySongScreen> createState() => _PlaySongScreenState();
}

class _PlaySongScreenState extends State<PlaySongScreen> {
  final player = AudioPlayer();
  late Music musicObjChange;
  int currentSongIndex = 0;
  Duration? duration;
  late bool isFavorite;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    musicObjChange = widget.musicObj;
    loadSong(musicObjChange.path);
    //add to recent playlist
    RecentlyFunctions.addToRecentlyPlayed(musicObjChange);
    currentSongIndex = widget.index;
    if (FavoriteFunctions.isFavour(musicObjChange) == true) {
      isFavorite = true;
    } else {
      isFavorite = false;
    }
  }

//play music
  void loadSong(String path) async {
    await player.setFilePath(path);
    duration = await player.setFilePath(path);
    player.play();
    setState(() {});
  }

  void isFavoriteChanged(bool? value) {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite == false) {
        setState(() {
          FavoriteFunctions.deleteFromFav(musicObjChange.id);
        });
      } else {
        setState(() {
          FavoriteFunctions.addToFavorite(song: musicObjChange);
        });
      }
    });
  }

  @override
  void dispose() {
    player.dispose(); // Release resources when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const backButton(),
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
                  const SizedBox(
                    height: 15,
                  ),
                  const Spacer(),
                  const Text('songArtist:unKnown',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontStyle: FontStyle.italic)),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(musicObjChange.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic))),
                      IconButton(
                        icon: isFavorite
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                        onPressed: () => isFavoriteChanged(isFavorite),
                      ),
                    ],
                  ),
                  songControllerButton()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column songControllerButton() {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            StreamBuilder<Duration>(
              stream: player.positionStream,
              builder: (context, snapshot) {
                final position = snapshot.data ?? Duration.zero;
                final maxDuration = duration?.inSeconds.toDouble() ?? 1.0;
                final sliderValue =
                    position.inSeconds.toDouble().clamp(0.0, maxDuration);
                return Slider(
                  min: 0,
                  max: maxDuration,
                  value: sliderValue,
                  activeColor: itembgcolor,
                  inactiveColor: Colors.white,
                  onChanged: (value) {
                    player.seek(Duration(seconds: value.round()));
                  },
                );
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder(
                  stream: player.positionStream,
                  builder: (context, duration) {
                    return Text(
                      durationFormat(duration.data ?? Duration.zero),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    );
                  }),

              // end time
              Text(
                durationFormat(duration ?? Duration.zero),
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 10,
            ),
            //--------skip previous----------//
            InkWell(
              onTap: () {
                if (currentSongIndex > 0) {
                  currentSongIndex = currentSongIndex - 1;
                } else {
                  currentSongIndex = songsNotifier.value.length - 1;
                }
                musicObjChange = songsNotifier.value[currentSongIndex];
                loadSong(musicObjChange.path);
              },
              child: const Icon(
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
                if (currentSongIndex < songsNotifier.value.length - 1) {
                  currentSongIndex = currentSongIndex + 1;
                } else {
                  currentSongIndex = 0;
                }
                musicObjChange = songsNotifier.value[currentSongIndex];
                loadSong(musicObjChange.path);
              },
              child: const Icon(
                Icons.fast_forward,
                color: Colors.white,
                size: 35,
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        )
      ],
    );
  }

  String durationFormat(Duration d) {
    if (d.inHours > 0) {
      return d.toString().split('.').first.padLeft(8, "0");
    }
    return d.toString().substring(2, 7);
  }
}
