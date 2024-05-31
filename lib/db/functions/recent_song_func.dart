import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

    // length of recently played maintain 9
    if (recentlyNotifier.value.length>9) {
      recentlyNotifier.value.removeAt(0);
      await recentlyBox.deleteAt(0);
    }
    recentlyNotifier.notifyListeners();
  }
    //read all song from recent
   
}