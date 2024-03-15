import 'package:flutter/material.dart';
import 'package:mikki_music/db/functions/function.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:on_audio_query/on_audio_query.dart';


class AllSongs extends StatelessWidget {
  AllSongs({super.key});

  final _audioQuery = OnAudioQuery();
  @override
  Widget build(BuildContext context) {
    List<AudioModel> fetchedAudio = [];
    return FutureBuilder<List<SongModel>>(
      future: _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No songs found"));
        }

      
        if (snapshot.hasData) {
          fetchedAudio = snapshot.data!
              .map((songModel) => AudioModel(
                    title: songModel.title,
                    artist: songModel.artist as String,
                  ))
              .toList();
          addToHive(fetchedAudio);
        }

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final audio = fetchedAudio[index];
            return ListTile(
              leading: const Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              title: Text(
                audio.title,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                audio.artist,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            );
          },
          itemCount: fetchedAudio.length,
        );
      },
    );
  }
}
