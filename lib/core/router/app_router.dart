import 'package:go_router/go_router.dart';
import 'package:sadec_smart_city/features/category_services/data/models/category_service_model.dart';
import 'package:sadec_smart_city/features/category_services/presentation/category_service_screen.dart';
import 'package:sadec_smart_city/features/detail_information/presentation/detail_information_screen.dart';
import 'package:sadec_smart_city/features/events/presentation/event_screen.dart';
import 'package:sadec_smart_city/features/home/data/models/menu_item_model.dart';
import 'package:sadec_smart_city/features/list_detail_category/presentation/list_detail_category_screen.dart';
import 'package:sadec_smart_city/features/home/presentation/home_screen.dart';
import 'package:sadec_smart_city/features/notifications/presentation/notifications_screen.dart';
import 'package:sadec_smart_city/features/profile/presentation/profile_screen.dart';
import 'package:sadec_smart_city/features/report_issue/presentation/report_issue_screen.dart';
import 'package:sadec_smart_city/shared/layouts/main_navigation_layout.dart';
import 'app_routes.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainNavigationLayout(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            name: AppRoutes.homeName,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.notification,
            name: AppRoutes.notificationName,
            builder: (context, state) => const NotificationsScreen(),
          ),
          GoRoute(
            path: AppRoutes.event,
            name: AppRoutes.eventName,
            builder: (context, state) => const EventCalendarScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            name: AppRoutes.profileName,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: AppRoutes.report,
            name: AppRoutes.reportName,
            builder: (context, state) => const ReportIssueScreen(),
          ),
          GoRoute(
            path: AppRoutes.categoryServices,
            name: AppRoutes.categoryServicesName,
            builder: (context, state) {
              final menuItem = state.extra as MenuItemModel;
              return CategoryServiceScreen(menuItem: menuItem);
            },
          ),
          GoRoute(
            path: AppRoutes.listDetailCategory,
            name: AppRoutes.listDetailCategoryName,
            builder: (context, state) {
              final categoryService = state.extra as CategoryServiceModel;
              return ListDetailCategoryScreen(categoryService: categoryService);
            },
          ),
          GoRoute(
            path: AppRoutes.detailInformation,
            name: AppRoutes.detailInformationName,
            builder: (context, state) {
              final args = state.extra as Map<String, dynamic>;
              final detailId = args['detailId'] as int;
              final tableId = args['tableId'] as int;
              return DetailInformationScreen(
                tableId: tableId,
                detailId: detailId,
              );
            },
          ),
        ],
      ),
    ],
  );
}
