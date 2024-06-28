import 'package:flutter/material.dart';
import 'package:mikki_music/widgets/all_color.dart';
import 'package:mikki_music/widgets/back_button.dart';
import 'package:mikki_music/widgets/constant.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundColor(
        child: SafeArea(
            child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           PreviousButton(),  
              Center(
                child: Text(
                  'Privacy Policy',
                  style: headding,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Your privacy is very important to us. This Privacy Policy outlines how Mikki Music gathers, uses, and safeguards your personal information.',
                style: normalText,
              ),
              sizeH10,
              Center(
                child: Text(
                  'Collection of Personal Data',
                  style: commontext,
                ),
              ),
              sizeH10,
              Text(
                'We may gather personal data, such as details about your device and the songs stored on it, to offer you a customized music experience.',
                style: normalText,
              ),
              sizeH10,
              Center(
                child: Text(
                  'Usage of Personal Data',
                  style: commontext,
                ),
              ),
              sizeH10,
              Text(
                'We utilize your information to enhance your experience, refine our services, and keep you informed about updates and new features.',
                style: normalText,
              ),
              sizeH10,
              Center(
                child: Text(
                  'Protection of Personal Data',
                  style: commontext,
                ),
              ),
              sizeH10,
              Text(
                'We do not sell, trade, or otherwise transfer your personal data to third parties without your consent, except as required by law. We employ security measures to safeguard your personal data against unauthorized access and disclosure.',
                style: normalText,
              ),
              sizeH10,
              Center(
                child: Text(
                  'Updates to Privacy Policy',
                  style: commontext,
                ),
              ),
              sizeH10,
              Text(
                'We may update our Privacy Policy from time to time. Please review this policy periodically for changes.',
                style: normalText,
              ),
              sizeH10,
              Center(
                child: Text(
                  'Agreement to Terms',
                  style: commontext,
                ),
              ),
              sizeH10,
              Text(
                'By using the Mikki Music application, you agree to the terms outlined in this Privacy Policy.',
                style: normalText,
              ),
              sizeH10,
              Center(
                child: Text(
                  'Contact Information',
                  style: commontext,
                ),
              ),
              sizeH10,
              Text(
                'If you have any questions or concerns about our Terms of Service or Privacy Policy, please contact us at shereenajamezz@gmail.com.',
                style: normalText,
              ),
              sizeH10,
              Text(
                'Thank you for using Mikki Music! \n',
                style: normalText,
              ),
            ],
          ),
        ),
      ),
    )));
  }
}
