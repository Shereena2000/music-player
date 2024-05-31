import 'package:flutter/material.dart';
import 'package:mikki_music/db/functions/recent_song_func.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/songs/song_tile.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/back_button.dart';

class RecentlyPlayedScreen extends StatefulWidget {
  const RecentlyPlayedScreen({super.key});

  @override
  State<RecentlyPlayedScreen> createState() => _RecentlyPlayedScreenState();
}

class _RecentlyPlayedScreenState extends State<RecentlyPlayedScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(),
              Center(
                child: Text(
                  "Recently Played",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                valueListenable: recentlyNotifier,
                builder: (BuildContext context, List<Music> recentlySongs,
                    Widget? child) {
                  if (recentlySongs.isEmpty) {
                    return const Padding(
                      padding: const EdgeInsets.only(top: 80, bottom: 150),
                      child: Center(
                        child: Text(
                          "No Recently played songs!",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    reverse: true,
                      shrinkWrap: true,
                      itemCount: recentlySongs.length,
                      itemBuilder: (context, index) {
                        final song = recentlySongs[index];
                        return SongTile(songName: song.title, musicObj: song,index: index,);
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
