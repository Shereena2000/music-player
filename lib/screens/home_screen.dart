import 'package:flutter/material.dart';
import 'package:mikki_music/screens/favorite_screen.dart';
import 'package:mikki_music/screens/recently_played_screen.dart';
import 'package:mikki_music/screens/settings_screen.dart';
import 'package:mikki_music/screens/tab_screen/playlist_screen.dart';
import 'package:mikki_music/screens/tab_screen/song_screen.dart';
import 'package:mikki_music/song_component/all_songs.dart';
import 'package:mikki_music/widgets/add_playlist.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    height: 5,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingScreen()));
                        },
                        child: Icon(
                          Icons.settings,
                          color: itemcolor,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  //-----------favourite-------------//
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
                  //---------recently played----------//
                  Padding(
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
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecentlyPlayedScreen()),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //-------------my playlist------------//
                  Padding(
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
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SongScreen(initialTabIndex: 1)),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AddPlaylist(
                    onPlaylistCreated: (playlistName) {
                      PlaylistManager.playlistNames.add(playlistName);
                    },
                  ),
                  //-----------all songs-------//
                  Padding(
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
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SongScreen(initialTabIndex: 0)),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  AllSongs()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
