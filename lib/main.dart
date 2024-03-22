import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/screens/play_song_screen.dart';
import 'package:mikki_music/screens/welcome_screen.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MIKKI MUSIC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const WelcomeScreen(),
    );
  }
}
