import 'package:flutter/material.dart';
import 'package:mikki_music/db/functions/playlist_func.dart';
import 'package:mikki_music/db/model/playlist_model.dart';
import 'package:mikki_music/screens/play_song_screen.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/back_button.dart';
import 'package:mikki_music/widgets/constant.dart';

class PlaylistFolderScreen extends StatefulWidget {
  final Playlist playlistObj;
  final int playlistIndex;
  const PlaylistFolderScreen(
      {super.key, required this.playlistObj, required this.playlistIndex});

  @override
  State<PlaylistFolderScreen> createState() => _PlaylistFolderScreenState();
}

class _PlaylistFolderScreenState extends State<PlaylistFolderScreen> {
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
                Row(
                  children: [
                    const backButton(),
                    const SizedBox(
                      width: 70,
                    ),
                    Center(
                      child: Text(
                        widget.playlistObj.name, 
                        style:const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),    
                Expanded(
                  child: widget.playlistObj.songs.isEmpty
                      ?const Center(
                          child: Text(
                            "No song in this Playlist!",
                            style: normalText,
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.playlistObj.songs.length,
                          itemBuilder: (context, index) {
                           
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlaySongScreen(
                                        musicObj: widget.playlistObj.songs[index],
                                        index: index,
                                      ),
                                    ),
                                  );
                                },
                               
                                child: ListTile(
                                  leading: Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: const DecorationImage(
                                        image:
                                            AssetImage('assets/images/music.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    width: 50.0,
                                    height: 50.0,
                                  ),
                                  title: Text(
                                    widget.playlistObj.songs[index].title,
                                    maxLines: 1,
                                    style:const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                     subtitle: Text(
                                    widget.playlistObj.songs[index].artist.toString()??"unknown",
                                    maxLines: 1,
                                    style:const TextStyle(
                                      color: Colors.white,
                                     
                                    ),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          PlaylistFunc.deleteSongFromPlaylist(
                                              widget.playlistIndex, index);
                                        });
                                      },
                                      icon:const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            );
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
