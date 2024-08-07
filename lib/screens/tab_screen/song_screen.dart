import 'package:flutter/material.dart';
import 'package:mikki_music/screens/tab_screen/playlist_screen.dart';
import 'package:mikki_music/song_component/all_songs.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/constant.dart';
import 'package:mikki_music/widgets/nav_bar.dart';


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
                  const Center(
                    child: Text(
                      "My Music",
                      style: headding
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
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
                                    style: commontext
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        // TabBarView to switch content (play list)
                        const Expanded(
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
    return const Column(
      children: [
       
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [AllSongs()],
          )),
        )
      ],
    );
  }
}
