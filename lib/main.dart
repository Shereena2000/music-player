import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/db/model/playlist_model.dart';

import 'package:mikki_music/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter<Music>(MusicAdapter());
  Hive.registerAdapter<Playlist>(PlaylistAdapter());

  //open box
  await Hive.openBox<Music>('musicbox');
  await Hive.openBox<int>('recentlyBox');
  await Hive.openBox<Playlist>('playlistBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
