import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/model/data_model.dart';

Future<void> addToHive(List<AudioModel> audioList) async {
  var box = await Hive.openBox<AudioModel>('audio_box');
  for (var audio in audioList) {
    await box.add(audio);
  }
}
