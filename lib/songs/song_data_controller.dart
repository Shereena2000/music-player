import 'package:flutter/material.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:get/get.dart';

class SongDataController extends GetxController {
  final AudioQuery = OnAudioQuery();

  RxList<SongModel> songList = <SongModel>[].obs;
  RxInt currentSongPlayingIndex = 0.obs;

  void getLocalSongs() async {
    songList.value = await AudioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL);
    // print(songList.value);
  }

  void findCurrentSongPlayingIndex(int songId) {
    var index = 0;
    songList.forEach((e) {
      if (e.id == songId) {
        currentSongPlayingIndex.value = index;
      }
      index++;
    });
    
    print(songId);
    print(currentSongPlayingIndex);
  }
  void playNextSong(){
    SongModel playNextSong =songList[currentSongPlayingIndex.value++];
  }
}
