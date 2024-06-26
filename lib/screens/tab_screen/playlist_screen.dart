import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/functions/playlist_func.dart';
import 'package:mikki_music/db/model/playlist_model.dart';
import 'package:mikki_music/screens/playlist_screen_4_each_folder.dart';
import 'package:mikki_music/widgets/add_playlist.dart';
import 'package:mikki_music/widgets/playlist_folder_popup.dart';
import 'package:mikki_music/widgets/constant.dart';

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
        padding: EdgeInsets.all(10.0),
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
                  const Text(
                    'Add New Playlist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                        style: TextStyle(
                            color: Color.fromARGB(255, 185, 182, 182),
                            fontSize: 20),
                      ),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
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

class PlaylistFolder extends StatelessWidget {
  final Playlist playlistObj;
  final int index;
  const PlaylistFolder({
    super.key,
    required this.playlistObj,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (Context) => PlaylistFolderScreen(
                    playlistObj: playlistObj,
                    playlistIndex: index,
                  ))),
      child: ListTile(
          leading: Container(
            height: 80.0,
            width: 70.0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/music2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            playlistObj.name,
            maxLines: 1,
            style: commontext,
          ),
          trailing: PlaylistFolderPopUp(
            folderName: playlistObj.name,
            index: index,
          )),
    );
  }
}

class PlaylistManager {
  static List<String> playlistNames = [];
}
