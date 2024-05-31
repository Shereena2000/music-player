import 'package:mikki_music/songs/song_player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';


// * class SongDataController extends GetxController {
  // SongPlayerController songPlayerController =Get.put(SongPlayerController());
  // final AudioQuery = OnAudioQuery();

  // RxList<SongModel> songList = <SongModel>[].obs;
  // RxInt currentSongPlayingIndex = 0.obs;

  //  void getLocalSongs() async {
  //   songList.value = await AudioQuery.querySongs(
  //       ignoreCase: true,
  //       orderType: OrderType.ASC_OR_SMALLER,
  //       sortType: null,
  //       uriType: UriType.EXTERNAL);
    
  // }

  // void findCurrentSongPlayingIndex(int songId) {
  //   var index = 0;
  //   songList.forEach((e) {
  //     if (e.id == songId) {
  //       currentSongPlayingIndex.value = index;
  //     }
  //     index++;
  //   });
    
  //  print(songId);
  //   print(currentSongPlayingIndex);
  // }
  // void playNextSong(){
  //   int songListLen =songList.length;
  //   currentSongPlayingIndex.value =currentSongPlayingIndex.value+1;
  //   if (currentSongPlayingIndex.value<songListLen) {
  //     SongModel nextSong =songList[currentSongPlayingIndex.value];
  //     songPlayerController.playLocalAudio(nextSong);
  //   }
    
  // }
  // void playPreviousSong (){
  //    int songListLen =songList.length;
  //   currentSongPlayingIndex.value =currentSongPlayingIndex.value-1;
  //   if (currentSongPlayingIndex.value < songListLen) {
  //     SongModel nextSong =songList[currentSongPlayingIndex.value];
  //     songPlayerController.playLocalAudio(nextSong);
  //   }
 
  // }
// }
