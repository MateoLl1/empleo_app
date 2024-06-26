


import 'package:flutter/material.dart';

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
    colorSchemeSeed: colorListApp[selectedColor]
  );


}

