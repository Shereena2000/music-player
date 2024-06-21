import 'package:flutter/material.dart';
import 'package:mikki_music/screens/setting_components/about_us.dart';
import 'package:mikki_music/screens/setting_components/privacy_policy_screen.dart';
import 'package:mikki_music/screens/setting_components/t_and_c_screen.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/back_button.dart';
import 'package:mikki_music/widgets/constant.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundColor(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const backButton(),
              const Center(
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  diougeabout(context);
                },
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                  size: 30,
                ),
                title: Text(
                  "About us",
                  style: commontext,
                ),
                trailing: forwardIcon,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TandCScreen()));
                },
                leading: Icon(
                  Icons.description,
                  color: Colors.white,
                  size: 30,
                ),
                title: Text(
                  "Terms & Conditions",
                  style: commontext,
                ),
                trailing: forwardIcon,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrivacyPolicyScreen()));
                },
                leading: Icon(
                  Icons.shield,
                  color: Colors.white,
                  size: 30,
                ),
                title: Text(
                  "Privacy Policy",
                  style: commontext,
                ),
                trailing: forwardIcon,
              )
            ],
          ),
        ),
      ),
    );
  }
}
