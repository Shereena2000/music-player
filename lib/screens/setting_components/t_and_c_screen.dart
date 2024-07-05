import 'package:flutter/material.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/back_button.dart';
import 'package:mikki_music/widgets/constant.dart';

class TandCScreen extends StatelessWidget {
  const TandCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundColor(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding:  EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               PreviousButton(),
                Center(
                  child: Text(
                    'Terms and Conditions',
                    style: headding,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Welcome to Smash Music!',
                  style: commontext,
                ),
                sizeH10,
                Text(
                  'These terms of service ("Terms") govern your use of the Smash Music application and its services. By using the Smash Music application, you agree to comply with and be bound by these Terms. If you do not agree with any part of these Terms, please do not use the Smash Music application.',
                  style: normalText,
                ),
                sizeH10,
                Text(
                  'The Smash Music application allows you to access and listen to music. Users are solely responsible for the content they upload, share, or otherwise make available on the Smash Music application. The Smash Music application and its content are protected by copyright and other intellectual property laws. You may not reproduce, distribute, modify, or create derivative works from any part of the Smash Music application without our prior written consent.',
                  style: normalText,
                ),
                sizeH10,
                Text(
                  'We reserve the right to terminate or suspend your access to the Smash Music application at any time without prior notice if you violate these Terms.',
                  style: normalText,
                ),
                sizeH10,
                Text(
                  'Thank you for using Smash Music!',
                  style: normalText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
