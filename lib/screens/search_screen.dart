import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikki_music/db/functions/add_song_to_hive.dart';
import 'package:mikki_music/db/model/data_model.dart';
import 'package:mikki_music/song_component/song_tile.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/back_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Music> searchMusic = [];
  late Box<Music> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<Music>('musicbox');
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    backButton(),
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        controller: searchController,
                        onChanged: (value) {
                          searchMusic.clear();
                          for (var song in songsNotifier.value) {
                            if (song.title
                                .toLowerCase()
                                .contains(value.toLowerCase())) {
                              searchMusic.add(song);
                            }
                          }
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          fillColor: Colors.white,
                          hintText: 'Search',
                          filled: true,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey.shade400),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade400,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(child: buildSongList())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSongList() {
    return ValueListenableBuilder(
      valueListenable: songsNotifier,
      builder: (context, List<Music> songs, child) {
        if (songs.isEmpty) {
          return const Center(
            child: Text('Music is Empty'),
          );
        }
        if (searchController.text.isNotEmpty && searchMusic.isEmpty) {
          return Center(
            child: Text('No music'),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: searchController.text.isNotEmpty
              ? searchMusic.length
              : songs.length,
          itemBuilder: (context, index) {
            final Music song = searchController.text.isNotEmpty
                ? searchMusic[index]
                : songs[index];
            return SongTile(
              songName: song.title,
              musicObj: song,
              index: index,
            );
          },
        );
      },
    );
  }
}
