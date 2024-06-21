import "package:flutter/material.dart";
import "package:mikki_music/widgets/all_color.dart";

class backButton extends StatelessWidget {
  const backButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
      ),
      child: CircleAvatar(
        backgroundColor: itembgcolor,
        radius: 20,
        child: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
