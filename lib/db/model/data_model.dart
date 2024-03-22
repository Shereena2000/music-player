import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class AudioModel {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String artist;

   @HiveField(2)
   late int songid;
  AudioModel({
    required this.title,
    required this.artist,
     required this.songid,
    
  });
}
