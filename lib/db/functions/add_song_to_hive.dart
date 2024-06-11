import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/model/data_model.dart';

//add song to hive
class AddSongsToHive extends ChangeNotifier {
  static Future<void> addSongToHive(List<Music> songs) async {
    final box = Hive.box<Music>('musicbox');
    await box.addAll(songs);
  }
}
