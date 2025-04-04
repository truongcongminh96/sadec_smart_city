import 'package:go_router/go_router.dart';
import 'app_routes.dart';
import 'package:sadec_smart_city/features/home/presentation/home_screen.dart';
import 'package:sadec_smart_city/features/report_issue/presentation/report_issue_screen.dart';
import 'package:sadec_smart_city/features/essential_services/presentation/essential_services_screen.dart';

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
    ],
  );
}
