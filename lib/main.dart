import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/functions/add_song_to_hive.dart';
import 'package:mikki_music/db/functions/change_song_model.dart';
import 'package:mikki_music/db/functions/fvrt_function.dart';
import 'package:mikki_music/db/functions/playlist_func.dart';
import 'package:mikki_music/db/functions/recent_song_func.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/db/model/playlist_model.dart';
import 'package:mikki_music/screens/splash_screen.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter<Music>(MusicAdapter());
  Hive.registerAdapter<Playlist>(PlaylistAdapter());

  //open box
  await Hive.openBox<Music>('musicbox');
  await Hive.openBox<int>('recentlyBox');
  await Hive.openBox<Playlist>('playlistBox');
  await Hive.openBox<int>('favoriteBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
//  bool _hasPermission = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAndRequestPermissions();
  }

  Future<void> checkAndRequestPermissions() async {
    var status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      List<SongModel> songModel = await _audioQuery.querySongs();
      await AddSongsToHive.addSongToHive(changeSongModel(songModel));
      await RecentlyFunctions.readRecentSongs();
      await PlaylistFunc.getPlaylist();
      await FavoriteFunctions.readFavSongs();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Storage permission is required to access audio files'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MIKKI MUSIC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}
