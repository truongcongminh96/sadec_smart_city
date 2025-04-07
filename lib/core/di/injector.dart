import 'package:get_it/get_it.dart';
import 'package:sadec_smart_city/core/network/api_service.dart';
import 'package:sadec_smart_city/features/essential_services/categories/automatic_teller_machine/data/repositories/automatic_teller_machine_repository.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/data/repositories/bank_repository.dart';
import 'package:sadec_smart_city/features/essential_services/categories/fuel_station/data/repositories/fuel_station_repository.dart';
import 'package:sadec_smart_city/features/essential_services/categories/other_essential_services/data/repositories/other_essential_services_repository.dart';
import 'package:sadec_smart_city/features/essential_services/categories/public_wifi_spot/data/repositories/public_wifi_spot_repository.dart';
import 'package:sadec_smart_city/features/essential_services/data/repositories/essential_services_repository.dart';
import 'package:sadec_smart_city/features/transportation_services/data/repositories/transportation_services_repository.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/data/repositories/travel_and_tourism_repository.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  // Register repositories, services here
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  //Essential services
  getIt.registerLazySingleton<EssentialServiceRepository>(
    () => EssentialServiceRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<OtherEssentialServicesRepository>(
    () => OtherEssentialServicesRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<BankRepository>(
    () => BankRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<AutomaticTellerMachineRepository>(
    () => AutomaticTellerMachineRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<FuelStationRepository>(
    () => FuelStationRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<PublicWifiSpotRepository>(
    () => PublicWifiSpotRepository(getIt<ApiService>()),
  );

  // Transportation services
  getIt.registerLazySingleton<TransportationServicesRepository>(
    () => TransportationServicesRepository(getIt<ApiService>()),
  );

  // Travel And Tourism
  getIt.registerLazySingleton<TravelAndTourismRepository>(
    () => TravelAndTourismRepository(getIt<ApiService>()),
  );
}
