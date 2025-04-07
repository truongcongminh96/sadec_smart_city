import 'package:flutter/material.dart';

class MatchaTheme {
  static const Color background = Color(0xFFE6F0EB);
  static const Color primary = Color(0xFF2E7D32);
  static const Color accent = Color(0xFF81C784);
  static const Color dark = Color(0xFF1B5E20);
  static const Color text = dark;

  // Dark Theme
  static const Color darkBackground = Color(0xFF121F1A);
  static const Color darkPrimary = Color(0xFF66BB6A);
  static const Color darkText = Color(0xFFE8F5E9);

  static const TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: text,
  );

  static ThemeData themeData({required bool isDarkMode}) {
    return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDarkMode ? darkBackground : background,
      primaryColor: isDarkMode ? darkPrimary : primary,
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkMode ? darkBackground : background,
        elevation: 0,
        foregroundColor: isDarkMode ? darkText : text,
        centerTitle: true,
      ),
      textTheme: (isDarkMode ? ThemeData.dark() : ThemeData.light()).textTheme
          .apply(
            bodyColor: isDarkMode ? darkText : text,
            displayColor: isDarkMode ? darkText : text,
          ),
      colorScheme:
          isDarkMode
              ? const ColorScheme.dark(
                primary: darkPrimary,
                onSurface: darkText,
                surface: Color(0xFF1A2A25),
              )
              : const ColorScheme.light(
                primary: primary,
                onSurface: text,
                surface: Colors.white,
              ),
    );
  }
}
