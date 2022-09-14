import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// final _uri_telegram = Uri.parse('https://www.google.com/');
String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

final Uri emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'dandelionunity@gmail.com',
  query: encodeQueryParameters(
      <String, String>{'subject': 'Example Subject & Symbols are allowed!'}),
);
final _uri_telegram = Uri.parse('https://t.me/Dandelionunity');

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 254, 216, 247),
                      Color.fromARGB(255, 196, 221, 254),
                    ],
                  ),
                ),
                child: Container(
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: 270,
              height: 270,
              child: Image.asset("assets/images/dlCo.png"),
            ),
            Positioned(
              bottom: 65,
              child: Wrap(
                spacing: 25.0,
                children: [
                  IconButton(
                    onPressed: () async {
                      _launchUrlTelegram();
                    },
                    icon: FaIcon(FontAwesomeIcons.telegram),
                    iconSize: 45,
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {
                      launchUrl(emailLaunchUri);
                    },
                    icon: FaIcon(FontAwesomeIcons.envelope),
                    iconSize: 45,
                    color: Colors.black,
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: FaIcon(FontAwesomeIcons.linkedin),
                  //   iconSize: 50,
                  //   color: Colors.black,
                  // ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              child: Text(
                'All Rights Reserved By Dandelion Co ©',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchUrlTelegram() async {
  if (!await launchUrl(_uri_telegram, mode: LaunchMode.externalApplication))
    throw 'Couldnt launch!!!';
}
