import 'package:flutter/material.dart';
import 'package:sadec_smart_city/core/theme/matcha_theme.dart';

class MatchaThemeWrapper extends StatelessWidget {
  final Widget child;

  const MatchaThemeWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: MatchaTheme.background,
        primaryColor: MatchaTheme.primary,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: MatchaTheme.text,
          displayColor: MatchaTheme.text,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: MatchaTheme.background,
          elevation: 0,
          foregroundColor: MatchaTheme.text,
        ),
      ),
      child: child,
    );
  }
}
