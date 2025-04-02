import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/theme/app_theme.dart';
import 'package:sadec_smart_city/core/theme/theme_cubit.dart';
import 'package:sadec_smart_city/core/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final systemBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;

    return BlocProvider(
      create: (_) => ThemeCubit(systemBrightness: systemBrightness),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
