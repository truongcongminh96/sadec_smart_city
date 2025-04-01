import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.soraTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green.shade600,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
