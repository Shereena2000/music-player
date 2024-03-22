import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mikki_music/screens/favorite_screen.dart';
import 'package:mikki_music/screens/play_song_screen.dart';
import 'package:mikki_music/songs/song_player_controller.dart';
import 'package:mikki_music/songs/song_tile.dart';
import 'package:mikki_music/widgets/add_playlist.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/nav_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mikki_music/songs/song_data_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SongDataController songDataController1 = Get.put(SongDataController());
  SongPlayerController songPlayerController = Get.put(SongPlayerController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
  }

  void requestPermission() {
    Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: const CustomNavBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (Context) => FavoriteScreen())),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: itembgcolor,
                      ),
                      height: 80,
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: itemcolor,
                              size: 30,
                            ),
                            const Text(
                              'Favorite Songs',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recently Played',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Playlist',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  AddPlaylist(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Songs',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 21),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => Column(
                        children: songDataController1.songList.value
                            .map((e) => SongTile(
                                  onPress: () {
                                    songPlayerController.playLocalAudio(e.data);
                                    songDataController1.findCurrentSongPlayingIndex(e.id);
                                    Get.to(PlaySongScreen(
                                        artistName: e.artist ?? 'UnKnown',
                                        songTitile: e.title));
                                  },
                                  songName: e.title,
                                ))
                            .toList()),
                  )

                  // SizedBox(height:1000,child:  AllSongs()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
