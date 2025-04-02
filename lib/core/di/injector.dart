import 'package:get_it/get_it.dart';
import 'package:sadec_smart_city/core/network/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  // Register repositories, services here
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}
