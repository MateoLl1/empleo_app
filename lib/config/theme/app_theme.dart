
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

const List<Color> colorListApp = [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purpleAccent,
];

class AppTheme {
  
  final int selectedColor;
  final bool isDark;

  AppTheme({
    required this.selectedColor,
    required this.isDark
  });

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDark ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorListApp[selectedColor],
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: isDark ? Colors.white : Colors.black,
        // fontFamily: 'Montserrat',
      ),
      bodyLarge: TextStyle(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 15,
        // fontFamily: 'Montserrat',
      ),
      titleMedium: TextStyle(
        color: isDark ? Colors.white : Colors.black,
        // fontFamily: 'Montserrat',
      ),
      labelLarge: TextStyle(
        color: isDark ? Colors.white : Colors.black,
        // fontFamily: 'Montserrat',
      ),
      bodyMedium: TextStyle(
        color: isDark ? Colors.white : Colors.black,
        // fontFamily: 'Montserrat',
      ),
      bodySmall: TextStyle(
        color: isDark ? Colors.white : Colors.black,
        // fontFamily: 'Montserrat',
      ),
    )
  );
}
