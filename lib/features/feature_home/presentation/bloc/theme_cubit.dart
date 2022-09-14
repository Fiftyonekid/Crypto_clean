import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/constants.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.system));

  bool get isDarkMode => state.themeMode == ThemeMode.dark;
  void toggleTheme(bool isOn) {
    state.themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    print(isOn);
    print("salamin");
    emit(ThemeState(themeMode: isOn ? ThemeMode.dark : ThemeMode.light));
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
