// import 'package:flutter/material.dart';
// import 'package:mikki_music/db/functions/playlist_func.dart';
// import 'package:mikki_music/db/model/data_model.dart';
// import 'package:mikki_music/screens/playlist_screen_4_each_folder.dart';
// import 'package:popover/popover.dart';

// class PlaylistPopUp extends StatefulWidget {
//   final int playlistIndex;
//   final int songIndex;
//   final Music musicObj;
//   const PlaylistPopUp({
//     super.key,
//     required this.playlistIndex,
//     required this.songIndex,
//     required this.musicObj,
//   });

//   @override
//   State<PlaylistPopUp> createState() => _PlaylistPopUpState();
// }

// class _PlaylistPopUpState extends State<PlaylistPopUp> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showPopover(
//             direction: PopoverDirection.left,
//             context: context,
//             bodyBuilder: (context) => PlaylistMenuItems(
//                 playlistIndex: widget.playlistIndex,
//                 songIndex: widget.songIndex,
//                 musicObj: widget.musicObj),
//             width: 180,
//             height: 120);
//         setState(() {});
//       },
//       child: const Icon(Icons.more_vert),
//     );
//   }
// }

// class PlaylistMenuItems extends StatefulWidget {
//   final int playlistIndex;
//   final int songIndex;
//   final Music musicObj;
//   const PlaylistMenuItems(
//       {super.key,
//       required this.playlistIndex,
//       required this.songIndex,
//       required this.musicObj});

//   @override
//   State<PlaylistMenuItems> createState() => _PlaylistMenuItemsState();
// }

// class _PlaylistMenuItemsState extends State<PlaylistMenuItems> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // 1st menu add to fvrt
//         // Container(
//         //   height: 40,
//         //   child: Text('Add to favorite'),
//         // ),
//         //2nd menu remove from fvrt
//         // Container(
//         //   height: 40,
//         //   child: Text('Remove from favorite'),
//         // ),
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               PlaylistFunc.deleteSongFromPlaylist(
//                   widget.playlistIndex, widget.songIndex);
//             });
//              Navigator.pop(context);
//              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PlaylistFolderScreen( playlistObj:playlistNotifier.value[widget.playlistIndex], playlistIndex: widget.playlistIndex)));
//           },
//           child: Container(
//             height: 40,
//             child: Text('Remove From Playlist'),
//           ),
//         )
//       ],
//     );
//   }
// }
