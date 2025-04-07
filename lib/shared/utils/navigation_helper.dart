import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sadec_smart_city/core/router/app_routes.dart';

class NavigationHelper {
  static void handleMenuTapWithMenuAppId(BuildContext context, int menuAppId) {
    switch (menuAppId) {
      case 3:
        context.pushNamed(AppRoutes.essentialServicesName, extra: menuAppId);
        break;
      case 4:
        context.pushNamed(
          AppRoutes.transportationServicesName,
          extra: menuAppId,
        );
        break;
      case 5:
        // context.pushNamed('education');
        break;
      case 7:
        context.pushNamed(AppRoutes.travelAndTourismName, extra: menuAppId);
        break;
      case 62:
        context.pushNamed(AppRoutes.fuelStationName, extra: menuAppId);
        break;
      case 63:
        context.pushNamed(
          AppRoutes.automaticTellerMachineName,
          extra: menuAppId,
        );
        break;
      case 78:
        context.pushNamed(AppRoutes.heritagePlaceName, extra: menuAppId);
        break;
      case 102:
        context.pushNamed(AppRoutes.bankName, extra: menuAppId);
        break;
      case 103:
        context.pushNamed(AppRoutes.publicWifiSpotName, extra: menuAppId);
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tính năng đang được cập nhật')),
        );
    }
  }

  static void handleDetailTapWithTableIdAnDetailId(
    BuildContext context, {
    required int tableId,
    required int detailId,
  }) {
    context.pushNamed(
      AppRoutes.heritagePlaceDetailName,
      extra: {'tableId': tableId, 'detailId': detailId},
    );
  }
}
