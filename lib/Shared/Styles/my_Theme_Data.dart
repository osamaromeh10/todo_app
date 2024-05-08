import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_Colors.dart';

class MyThemeData {
  static String backGroundLight = "assets/images/background.png";
  static String backGroundDark = "assets/images/darkback.png";
      //Light Theme

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: mintColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),

    ),




      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor:primaryColor,
        unselectedItemColor: greyColor,
        backgroundColor: whiteColor,
        type: BottomNavigationBarType.fixed,
      ),
  );














  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: secondaryColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: secondaryColor
      ),
backgroundColor: primaryColor,
titleTextStyle: TextStyle(
  color: secondaryColor,
)
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: whiteColor,
backgroundColor: secondaryColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),


  );
}


