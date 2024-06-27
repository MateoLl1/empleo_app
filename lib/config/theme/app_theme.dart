


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
      titleLarge: GoogleFonts.montserrat(
        color: isDark ? Colors.white : Colors.black
      ),

      bodyLarge: GoogleFonts.montserrat(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 15
      ),
      titleMedium: GoogleFonts.montserrat(
        color: isDark ? Colors.white : Colors.black
      ),
      labelLarge: GoogleFonts.montserrat(
        color: isDark ? Colors.white : Colors.black
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: isDark ? Colors.white : Colors.black
      ),
    )
  );


}

