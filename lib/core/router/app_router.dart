import 'app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:sadec_smart_city/features/essential_services/categories/automatic_teller_machine/presentation/automatic_teller_machine_screen.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/presentation/bank_screen.dart';
import 'package:sadec_smart_city/features/essential_services/categories/fuel_station/presentation/fuel_station_screen.dart';
import 'package:sadec_smart_city/features/home/presentation/home_screen.dart';
import 'package:sadec_smart_city/features/report_issue/presentation/report_issue_screen.dart';
import 'package:sadec_smart_city/features/essential_services/presentation/essential_services_screen.dart';
import 'package:sadec_smart_city/features/essential_services/categories/public_wifi_spot/presentation/public_wifi_spot_screen.dart';

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
        builder: (context, state) => const EssentialServicesScreen(),
      ),
      GoRoute(
        path: AppRoutes.bank,
        name: AppRoutes.bankName,
        builder: (context, state) => const BankScreen(),
      ),
      GoRoute(
        path: AppRoutes.automaticTellerMachine,
        name: AppRoutes.automaticTellerMachineName,
        builder: (context, state) => const AutomaticTellerMachineScreen(),
      ),
      GoRoute(
        path: AppRoutes.fuelStation,
        name: AppRoutes.fuelStationName,
        builder: (context, state) => const FuelStationScreen(),
      ),
      GoRoute(
        path: AppRoutes.publicWifiSpot,
        name: AppRoutes.publicWifiSpotName,
        builder: (context, state) => const PublicWifiSpotScreen(),
      ),
    ],
  );
}
