import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF253D79);
  static const Color secondaryColor = Color(0xFF2380A8);

  static ThemeData appTheme = ThemeData(
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(color: Color(0xFFF4F2F2), fontSize: 24, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: const Color(0xFFF4F2F2),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 16,
        color: primaryColor,
      ),
      titleMedium: TextStyle(fontSize: 12, color: secondaryColor),
    
    ),
  );
}
