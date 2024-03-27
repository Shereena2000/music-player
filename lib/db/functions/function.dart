import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/model/data_model.dart';
Map<String, List<dynamic>> recentlyPlayedList = {
  'title': [],
  'artist': [],
  'uri': [],
  'id': [],
};
Future<void> addToPlaylist(List<AudioModel> audioList) async {
  final playlistBox= await Hive.openBox<AudioModel>('playlist');
  for (var audio in audioList) {
    await playlistBox.add(audio);
  }
}
//----------- Database for--------rectectlyplayed---------------//
Future<void> addToRecntlyplayed(List<AudioModel> audioList) async {
 final recentBox= await Hive.openBox<AudioModel>('recently_db');
  for (var audio in audioList) {
    await recentBox.add(audio);
  }
}

Future<void>getRecentlyPlayed ()async{
 final recentBox= await Hive.openBox<AudioModel>('recently_db');
  for (var audio in recentBox.values) {
    recentlyPlayedList['title']!.add(audio.title);
    recentlyPlayedList['artist']!.add(audio.artist);
    recentlyPlayedList['uri']!.add(audio.uri);
    recentlyPlayedList['id']!.add(audio.songid);
  }

}