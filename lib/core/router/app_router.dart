import 'app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:sadec_smart_city/features/essential_services/categories/automatic_teller_machine/presentation/automatic_teller_machine_screen.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/presentation/bank_screen.dart';
import 'package:sadec_smart_city/features/essential_services/categories/fuel_station/presentation/fuel_station_screen.dart';
import 'package:sadec_smart_city/features/home/presentation/home_screen.dart';
import 'package:sadec_smart_city/features/report_issue/presentation/report_issue_screen.dart';
import 'package:sadec_smart_city/features/essential_services/presentation/essential_services_screen.dart';
import 'package:sadec_smart_city/features/essential_services/categories/public_wifi_spot/presentation/public_wifi_spot_screen.dart';
import 'package:sadec_smart_city/features/transportation_services/presentation/transportation_services_screen.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/presentation/heritage_place_screen.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/presentation/travel_and_tourism_screen.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/presentation/detail/heritage_place_detail_screen.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/presentation/detail/tourism_attraction_detail_screen.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/presentation/tourism_attraction_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.homeName,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.report,
        name: AppRoutes.reportName,
        builder: (context, state) => const ReportIssueScreen(),
      ),
      GoRoute(
        path: AppRoutes.essentialServices,
        name: AppRoutes.essentialServicesName,
        builder: (context, state) {
          final menuAppId = state.extra as int;
          return EssentialServicesScreen(menuAppId: menuAppId);
        },
      ),
      GoRoute(
        path: AppRoutes.bank,
        name: AppRoutes.bankName,
        builder: (context, state) {
          final menuAppId = state.extra as int;
          return BankScreen(menuAppId: menuAppId);
        },
      ),
      GoRoute(
        path: AppRoutes.automaticTellerMachine,
        name: AppRoutes.automaticTellerMachineName,
        builder: (context, state) {
          final menuAppId = state.extra as int;
          return AutomaticTellerMachineScreen(menuAppId: menuAppId);
        },
      ),
      GoRoute(
        path: AppRoutes.fuelStation,
        name: AppRoutes.fuelStationName,
        builder: (context, state) {
          final menuAppId = state.extra as int;
          return FuelStationScreen(menuAppId: menuAppId);
        },
      ),
      GoRoute(
        path: AppRoutes.publicWifiSpot,
        name: AppRoutes.publicWifiSpotName,
        builder: (context, state) {
          final menuAppId = state.extra as int;
          return PublicWifiSpotScreen(menuAppId: menuAppId);
        },
      ),
      GoRoute(
        path: AppRoutes.transportationServices,
        name: AppRoutes.transportationServicesName,
        builder: (context, state) {
          final menuAppId = state.extra as int;
          return TransportationServicesScreen(menuAppId: menuAppId);
        },
      ),
      GoRoute(
        path: AppRoutes.travelAndTourism,
        name: AppRoutes.travelAndTourismName,
        builder: (context, state) {
          final menuAppId = state.extra as int;
          return TravelAndTourismScreen(menuAppId: menuAppId);
        },
      ),
      GoRoute(
        path: AppRoutes.heritagePlace,
        name: AppRoutes.heritagePlaceName,
        builder: (context, state) {
          final menuAppId = state.extra as int;
          return HeritagePlacesScreen(menuAppId: menuAppId);
        },
      ),
      GoRoute(
        path: AppRoutes.heritagePlaceDetail,
        name: AppRoutes.heritagePlaceDetailName,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final detailId = args['detailId'] as int;
          final tableId = args['tableId'] as int;

          return HeritagePlaceDetailScreen(
            tableId: tableId,
            detailId: detailId,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.tourismAttraction,
        name: AppRoutes.tourismAttractionName,
        builder: (context, state) {
          final menuAppId = state.extra as int;
          return TourismAttractionScreen(menuAppId: menuAppId);
        },
      ),
      GoRoute(
        path: AppRoutes.tourismAttractionDetail,
        name: AppRoutes.tourismAttractionDetailName,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final detailId = args['detailId'] as int;
          final tableId = args['tableId'] as int;

          return TourismAttractionDetailScreen(
            tableId: tableId,
            detailId: detailId,
          );
        },
      ),
    ],
  );
}
