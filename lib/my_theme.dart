import 'package:flutter/material.dart';

class MyTheme {
  static const c_blue = Color(0xff5D9CEC);
  static const c_green = Color(0xff61E757);
  static const c_red = Color(0xffEC4B4B);
  static const c_lightGreen = Color(0xffdcf1d5);
  static const c_title = Color(0xff363636);

  /*static const c_gold = Color.fromRGBO(183, 147, 95, 1.0);
  static const c_less_gold = Color.fromRGBO(217, 190, 151, 1.0);
  static const c_darkGold = Color.fromRGBO(250, 204, 29, 1.0);
  static const c_darkBlue = Color.fromRGBO(20, 26, 46, 1.0);*/

  static var lightTheme = ThemeData(
    scaffoldBackgroundColor: c_lightGreen,
    //canvasColor: c_lightGreen,
    primaryColor: c_blue,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: c_blue,
        onPrimary: Colors.white,
        secondary: c_blue,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.red,
        background: c_lightGreen,
        onBackground: c_blue,
        surface: Colors.white,
        onSurface: c_title    // for the surface of the editText
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      color: c_blue,
      /*titleTextStyle: TextStyle(
          fontSize: 25,
          color: c_blue,
        ),*/
    ),

    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        //////////////////////////////////
        color: c_blue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: c_title,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Color(0xff200E32),
        fontSize: 12,
      ),
    ),

    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: c_blue),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //backgroundColor: Colors.white,
      elevation: 0,
      selectedItemColor: c_blue,
      unselectedItemColor: Colors.grey,
    ),

    bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        backgroundColor: Colors.white),
  );
}
