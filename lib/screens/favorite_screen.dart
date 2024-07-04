import 'package:flutter/material.dart';
import 'package:mikki_music/db/functions/fvrt_function.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/song_component/song_tile.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/back_button.dart';
import 'package:mikki_music/widgets/constant.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PreviousButton(),
                const Center(
                  child: Text(
                    "Favourite Songs",
                    style: headding,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  maxLines: 1,
                  "My Soundtrack",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: favoriteNotifier,
                      builder: (context, List<Music> favSongs, child) {
                        if (favSongs.isEmpty) {
                          return const Center(
                            child: Text(
                              'Favourite songs Empty!!!',
                              style: normalText,
                            ),
                          );
                        }
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: favSongs.length,
                            itemBuilder: (context, index) {
                              return SongTile(
                                  artistName: favSongs[index].artist.toString(),
                                  songName: favSongs[index].title,
                                  musicObj: favSongs[index],
                                  index: index);
                            });
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
