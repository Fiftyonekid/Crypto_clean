import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interacting_with_api/core/screens/about_us_screen.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/screens/crypto_screen.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/screens/temp.dart';
import 'package:flutter_interacting_with_api/features/feature_home/presentation/widgets/nav_bar.dart';

import '../screens/splash_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidget = [
      AboutUsScreen(),
      // CryptoScreen(),
    ];
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: NavBar(Controller: pageController),
      body: Container(
        height: height,
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
      ),
    );
  }
}
