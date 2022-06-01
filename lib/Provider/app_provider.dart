import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  String themeString = 'light';
  late SharedPreferences prefs;

  Future<void> changeThemeMode({required ThemeMode mode}) async {
    if (themeMode != mode) {
      themeMode = mode;
      (themeMode == ThemeMode.light)
          ? themeString = 'light'
          : themeString = 'dark';

      prefs = await SharedPreferences.getInstance();
      prefs.setString('themeString', themeString);
      notifyListeners();
    }
  }

// Future<ThemeMode?> getMode()
// async {
//   prefs = await SharedPreferences.getInstance();
//   themeString = prefs.getString('themeString') ?? 'light';
//
//   if(themeString == 'light') {
//     return themeMode = ThemeMode.light;
//   } else {
//     return themeMode = ThemeMode.dark;
//   }
// }

}
