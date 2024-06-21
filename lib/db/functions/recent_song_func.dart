import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/functions/add_song_to_hive.dart';
import 'package:mikki_music/db/model/data_model.dart';

ValueNotifier<List<Music>> recentlyNotifier =ValueNotifier([]);

class RecentlyFunctions extends ChangeNotifier{
  
  //hive reference
  static final recentlyBox =Hive.box<int>('recentlyBox');

  //add to hive and recentnotifier
  static Future<void> addToRecentlyPlayed(Music song) async{
    //remove duplicate
    recentlyBox.delete(recentlyBox.values.toList().indexOf(song.id));
    recentlyNotifier.value.remove(song);

    //add 
    await recentlyBox.add(song.id);
    recentlyNotifier.value.add(song);

    // length of recently played maintain 8
    if (recentlyNotifier.value.length>8) {
      recentlyNotifier.value.removeAt(0);
      await recentlyBox.deleteAt(0);
    }
    recentlyNotifier.notifyListeners();
  }
  
   
static Future<void>readRecentSongs()async{
  recentlyNotifier.value.clear();
  for (var song in songsNotifier.value) {
    if (isRecent(song)) {
      recentlyNotifier.value.add(song);
    }
    
  }
  recentlyNotifier.notifyListeners();
}

static bool isRecent(Music song){
  if(recentlyBox.values.contains(song.id)){
    return true;
  }
  return false;
}
}