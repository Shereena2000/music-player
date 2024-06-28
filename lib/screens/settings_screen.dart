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
              const PreviousButton(),
              const Center(
                child: Text(
                  'Settings',
                  style: headding,
                ),
              ),
              ListTile(
                onTap: () {
                  diougeabout(context);
                },
                leading: const Icon(
                  Icons.info,
                  color: Colors.white,
                  size: 30,
                ),
                title: const Text(
                  "About us",
                  style: commontext,
                ),
                trailing: forwardIcon,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TandCScreen()));
                },
                leading: const Icon(
                  Icons.description,
                  color: Colors.white,
                  size: 30,
                ),
                title: const Text(
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
                          builder: (context) => const PrivacyPolicyScreen()));
                },
                leading: const Icon(
                  Icons.shield,
                  color: Colors.white,
                  size: 30,
                ),
                title: const Text(
                  "Privacy Policy",
                  style: commontext,
                ),
                trailing: forwardIcon,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0), 
                child: Center(
                  child: Text(
                    'version 1.0.0',
                    style: TextStyle(
                      color: itembgcolor, 
                      fontSize:15,
                       fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
