import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();

  final directory = await getApplicationDocumentsDirectory();
  final hydratedStorage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(directory.path),
  );

  HydratedBloc.storage = hydratedStorage;
  runApp(const MyApp());
}
