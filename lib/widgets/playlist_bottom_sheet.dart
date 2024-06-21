import 'package:flutter/material.dart';
import 'package:mikki_music/db/functions/playlist_func.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/constant.dart';

Future playlistBottomSheet(BuildContext context, Music song) {
  return showModalBottomSheet(
    backgroundColor: itembgcolor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    context: context,
    builder: (context) => SizedBox(
      height: 500,
      child: ValueListenableBuilder(
        valueListenable: playlistNotifier,
        builder: (context, playlist, child) {
          if (playlist.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Center(
                  child: Text(
                'Playlist is Empty',
                style: commontext,
              )),
            );
          }
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  PlaylistFunc.addSongToPlaylist(index, song, context);
                  Navigator.pop(context);
                },
                title: Text(
                  playlist[index].name,
                  style: commontext,
                ),
              );
            },
          );
        },
      ),
    ),
  );
}
