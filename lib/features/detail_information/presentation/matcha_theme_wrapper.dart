import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/theme/matcha_theme.dart';
import 'package:sadec_smart_city/core/theme/theme_cubit.dart';

class MatchaThemeWrapper extends StatelessWidget {
  final Widget child;

  const MatchaThemeWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    final isDark = themeMode == ThemeMode.dark;

    return Theme(data: MatchaTheme.themeData(isDarkMode: isDark), child: child);
  }
}
