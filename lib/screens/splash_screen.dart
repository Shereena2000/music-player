import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mikki_music/db/functions/add_song_to_hive.dart';
import 'package:mikki_music/db/functions/change_song_model.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/screens/home_screen.dart';
import 'package:on_audio_query/on_audio_query.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _hasPermission = false;    
  final OnAudioQuery _audioQuery = OnAudioQuery(); 
 //SongDataController songDataController=Get.put(SongDataController());
  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
    checkAndRequestPermissions();
    gotoHome();
  }
  Future<void>checkAndRequestPermissions({bool retry = false}) async{
    _hasPermission =await await _audioQuery.checkAndRequest(
      retryRequest: retry
    ); 
    if (_hasPermission) {
      List<SongModel>songModel = await _audioQuery.querySongs();
      await AddSongsToHive.addSongToHive(changeSongModel(songModel));
    
    }
    _hasPermission ? setState(() {}):null;
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(width: 0, color:
              const Color.fromARGB(0, 122, 10, 10)
             ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 54, 15, 171),
            Color.fromARGB(255, 75, 27, 162)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'MIKKI MUSIC',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Make Your Life More Live',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
               
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/welcome1.jpg',
                        fit: BoxFit.cover,
                        height: 400 ,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> gotoHome() async {
    //fetch songs
    // * songDataController.getLocalSongs(); 
 
  await Future.delayed(Duration(seconds: 3));

  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()),
  );
}
}


