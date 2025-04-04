import 'package:get_it/get_it.dart';
import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/essential_services/data/repositories/essential_services_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  // Register repositories, services here
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<EssentialServiceRepository>(
    () => EssentialServiceRepository(getIt<ApiService>()),
  );
}
