import "package:flutter/material.dart";
import "package:mikki_music/widgets/all_color.dart";

class AddPlaylist extends StatelessWidget {
  const AddPlaylist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showCreatePlaylistDialog(context);
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

  Future _showCreatePlaylistDialog(BuildContext context) async {
      String? playlistName = await  showDialog<String>(
        context: context,
        builder: (BuildContext context) {
           String newName = 'playlist';
          return AlertDialog(
            title: Text('Create New Playlist',style: TextStyle(color: itembgcolor),),
            content: TextField(onChanged: (value){
          newName = value;
            },
              decoration: InputDecoration(hintText: 'Enter Playlist Name'),),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                  ),
                 ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop( newName.isEmpty ? 'playlist' : newName);
              },
              child: Text('Create'),
            ),
            ],
          );
        });
  } 
}
   