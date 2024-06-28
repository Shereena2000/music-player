import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mikki_music/db/functions/recent_song_func.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/song_component/song_tile.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/back_button.dart';
import 'package:mikki_music/widgets/constant.dart';

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
              const PreviousButton(),
              const Center(
                child: Text(
                  "Recently Played",
                  style: headding,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: recentlyNotifier,
                  builder: (BuildContext context, List<Music> recentlySongs,
                      Widget? child) {
                    if (recentlySongs.isEmpty) {
                      return const Center(
                        child: Text("No Recently played songs!!!",
                            style: normalText),
                      );
                    }
                    return ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: recentlySongs.length,
                        itemBuilder: (context, index) {
                          final song = recentlySongs[index];
                          return SongTile(
                            songName: song.title,
                            musicObj: song,
                            index: index,
                            artistName: song.artist.toString(),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
