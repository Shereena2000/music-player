import 'package:flutter/material.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/constant.dart';

void diougeabout(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: itembgcolor,
          title:const Text(
            'About us',
            style: headding,
          ),
          content:const Text(
            'Rock your favorite music, anywhere! Mikki  lets you access and organize your music library on your phone, all offline. More features coming soon . . . .',
            style: commontext,
          ),
        );
      });
}
