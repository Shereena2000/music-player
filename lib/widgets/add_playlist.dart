import "package:flutter/material.dart";
import "package:mikki_music/db/functions/playlist_func.dart";
import "package:mikki_music/widgets/all_color.dart";

class AddPlaylist extends StatelessWidget {
  final Function(String) onPlaylistCreated;
  const AddPlaylist({
    super.key,
    required this.onPlaylistCreated,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PlaylistName createfolder = PlaylistName();
        createfolder.showCreatePlaylistDialog(context);
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: itembgcolor, borderRadius: BorderRadius.circular(15)),
        child: Icon(
          Icons.add,
          color: itemcolor,
          size: 35,
        ),
      ),
    );
  }
}

class PlaylistName {
  final _key = GlobalKey<FormState>();
  String folderName = "";
  TextEditingController folderNameController = TextEditingController();

  void saveFolderName(BuildContext context) {
    final isvalid = _key.currentState?.validate();

    if (isvalid != null && isvalid) {
      _key.currentState?.save();
      if (playlistNotifier.value.any((playlist) => playlist.name==folderName)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Playlist name already exists!'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,),);return;
      }
      PlaylistFunc.createPlaylistFolder(folderName,context);
    }
  }

  Future<dynamic> showCreatePlaylistDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Create New Playlist',
            style: TextStyle(color: itembgcolor),
          ),
          content: Form(
              key: _key,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Playlist Name';
                  }
                  return null;
                },
                controller: folderNameController,
                decoration: InputDecoration(labelText: 'Enter Playlist Name'),
                onSaved: (value) {
                  folderName = value.toString();
                },
              )),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                saveFolderName(context);
                Navigator.pop(context);
                folderNameController.clear();
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }
}
