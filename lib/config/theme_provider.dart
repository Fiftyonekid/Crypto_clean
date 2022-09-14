import 'package:flutter/material.dart';

import '../core/utils/constants/constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;


  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black12,
      colorScheme: ColorScheme.dark(),
      primaryColor: Colors.white,
      bottomAppBarColor: Color.fromARGB(255, 3, 3, 3),
      indicatorColor: Color.fromARGB(255, 255, 196, 0),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.grey[800], actionTextColor: Colors.white));
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      primaryColor: Colors.black,
      bottomAppBarColor: Color.fromARGB(255, 245, 245, 245),
      indicatorColor: Colors.grey[900],
      snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.grey[600], actionTextColor: whiteColor));
}
