import 'package:flutter/material.dart';
import 'package:mikki_music/widgets/add_playlist.dart';

class PlaylistTab extends StatefulWidget {
  const PlaylistTab({super.key});

  @override
  State<PlaylistTab> createState() => _PlaylistTabState();
}

class _PlaylistTabState extends State<PlaylistTab> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AddPlaylist(),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Add New Playlist',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
