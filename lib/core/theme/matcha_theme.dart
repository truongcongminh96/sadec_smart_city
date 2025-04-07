import 'package:flutter/material.dart';

class MatchaTheme {
  static const Color background = Color(0xFFE6F0EB);
  static const Color primary = Color(0xFF2E7D32);
  static const Color accent = Color(0xFF81C784);
  static const Color dark = Color(0xFF1B5E20);
  static const Color text = dark;

  static const TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: text,
  );

  static ThemeData themeData(BuildContext context) {
    return Theme.of(context).copyWith(
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      textTheme: Theme.of(
        context,
      ).textTheme.apply(bodyColor: text, displayColor: text),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        foregroundColor: text,
      ),
    );
  }
}
