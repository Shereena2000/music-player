import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mikki_music/db/functions/function.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/screens/play_song_screen.dart';
import 'package:mikki_music/screens/songs_screen/playlist_screen.dart';
import 'package:mikki_music/songs/song_data_controller.dart';
import 'package:mikki_music/songs/song_player_controller.dart';
import 'package:mikki_music/songs/song_tile.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/nav_bar.dart';
import 'package:mikki_music/widgets/play_shuffle_switch.dart';

class SongScreen extends StatelessWidget {
  final int initialTabIndex;
  const SongScreen({super.key, required this.initialTabIndex});

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Songs', 'Playlist'];
    return DefaultTabController(
      initialIndex: initialTabIndex,
      length: tabs.length,
      child: BackgroundColor(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: const CustomNavBar(),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Centered "My Music" title
                  const Center(
                    child: Text(
                      "My Music",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 10), // Add spacing between title and tabs
                  Expanded(
                    // Make tabs and content fill available space
                    child: Column(
                      children: [
                        // TabBar for Songs and Playlist
                        TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.white,
                          tabs: tabs
                              .map(
                                (tab) => Tab(
                                  icon: Text(
                                    tab,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        // TabBarView to switch content
                        Expanded(
                          child: TabBarView(
                            children: [
                              SongsTab(), // Songs tab with PlayOrShuffleSwitch
                              PlaylistTab(), // Playlist tab
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SongsTab extends StatelessWidget {
  const SongsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SongDataController songDataController = Get.put(SongDataController());
    SongPlayerController songPlayerController = Get.put(SongPlayerController());
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        PlayOrShuffleSwitch(),
        SizedBox(
          height: 10,
        ),
        Obx(
          () => Expanded(
            child: SingleChildScrollView(
              child: Column(
                  children: songDataController.songList
                      .map((e) => SongTile(
                            onPress: () async {
                              songPlayerController.playLocalAudio(e);
                              songDataController
                                  .findCurrentSongPlayingIndex(e.id);
                              Get.to(PlaySongScreen());
                              AudioModel audioModel = AudioModel(
                                title: e.title,
                                artist: e.artist??'unknwn',
                                songid: e
                                    .id, 
                                uri: e.uri!,
                              );

                              await addToRecntlyplayed([
                                audioModel
                              ]); 
                            },
                            songName: e.title,
                          ))
                      .toList()),
            ),
          ),
        )
      ],
    );
  }
}
