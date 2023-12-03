import 'package:flutter/material.dart';

class CustomThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    // useMaterial3: true,
    hintColor: Colors.green,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    // Define other theme properties for the light mode
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.teal,
    hintColor: Colors.orange,
    // useMaterial3: true,
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    // Define other theme properties for the dark mode
  );

  static ThemeData blackTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    // useMaterial3: true,
    hintColor: Colors.white,
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    // Define other theme properties for the black mode
  );
}
