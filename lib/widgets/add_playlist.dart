import "package:flutter/material.dart";
import "package:mikki_music/widgets/all_color.dart";


class AddPlaylist extends StatelessWidget {
  const AddPlaylist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: itembgcolor,
          borderRadius: BorderRadius.circular(15)),
      child: Icon(
        Icons.add,
        color: itemcolor,
        size: 35,
      ),
    );
  }
}
