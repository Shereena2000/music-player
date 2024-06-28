import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/functions/playlist_func.dart';
import 'package:mikki_music/db/model/playlist_model.dart';
import 'package:mikki_music/widgets/add_playlist.dart';
import 'package:mikki_music/widgets/constant.dart';
import 'package:mikki_music/widgets/playlist_tile.dart';

class PlaylistTab extends StatefulWidget {
  const PlaylistTab({super.key});

  @override
  State<PlaylistTab> createState() => _PlaylistTabState();
}

class _PlaylistTabState extends State<PlaylistTab> {
  // static List<String> playlistNames = [];
  late Box playistBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playistBox = Hive.box<Playlist>('playlistBox');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 15),
              child: Row(
                children: [
                  AddPlaylist(
                    onPlaylistCreated: (playlistName) {
                      setState(() {
                        PlaylistManager.playlistNames.add(playlistName);
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('Add New Playlist', style: commontext),
                ],
              ),
            ),
            ValueListenableBuilder(
                valueListenable: playlistNotifier,
                builder: (context, playlist, child) {
                  if (playlist.isEmpty) {
                    return const Center(
                      child: Text(
                        '',
                      ),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: playlist.length,
                    itemBuilder: (context, index) {
                      return PlaylistFolder(
                        playlistObj: playlist[index],
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}

class PlaylistManager {
  static List<String> playlistNames = [];
}
