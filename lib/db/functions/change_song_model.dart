import 'package:mikki_music/db/model/data_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

   // convert songModel to music
List<Music> changeSongModel(List<SongModel> songModel){
List<Music> songs =[];
for (var song in songModel) {
  songs.add(Music(id: song.id, path: song.data, title: song.title,album: song.album ?? "unknown"),);
}
return songs;
}