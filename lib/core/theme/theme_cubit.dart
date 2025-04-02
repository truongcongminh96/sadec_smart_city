import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit({required Brightness systemBrightness})
    : super(_fromSystem(systemBrightness));

  static ThemeMode _fromSystem(Brightness brightness) {
    return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    final themeStr = json['theme'] as String?;
    if (themeStr == 'dark') return ThemeMode.dark;
    if (themeStr == 'light') return ThemeMode.light;
    return ThemeMode.system;
  }

  @override
  Map<String, dynamic> toJson(ThemeMode state) {
    return {'theme': state.name};
  }
}
