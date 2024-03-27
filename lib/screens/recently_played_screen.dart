import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mikki_music/db/functions/function.dart';
import 'package:mikki_music/songs/song_tile.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/back_button.dart';

class RecentlyPlayedScreen extends StatelessWidget {
  const RecentlyPlayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
        child: SafeArea(
            child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backButton(),
          Center(
            child: Text(
              "Recently Played",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10,),
        if (recentlyPlayedList['title']?.isNotEmpty == true)
                for (var i = 0; i < recentlyPlayedList['title']!.length; i++)
                  SongTile(
                    songName: recentlyPlayedList['title']?[i], // Access title at index i
                    onPress: (){}, // Assuming onPress is a valid callback
                  ),
              // Display a message if there are no recently played songs
              if (recentlyPlayedList['title']?.isEmpty == true)
                Center(
                  child: Text(
                    "No recently played songs yet.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
        ],
      ),
    )));
  }
}
