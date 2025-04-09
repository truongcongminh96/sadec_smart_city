import 'package:get_it/get_it.dart';
import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/category_services/data/repositories/category_service_repository.dart';
import 'package:sadec_smart_city/features/detail_information/data/repositories/detail_information_repository.dart';
import 'package:sadec_smart_city/features/list_detail_category/data/repository/list_detail_category_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  // Register repositories, services here
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  //Category services
  getIt.registerLazySingleton<CategoryServiceRepository>(
    () => CategoryServiceRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<ListDetailCategoryRepository>(
    () => ListDetailCategoryRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<DetailInformationRepository>(
    () => DetailInformationRepository(getIt<ApiService>()),
  );
}
