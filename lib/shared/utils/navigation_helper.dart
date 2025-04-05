import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sadec_smart_city/core/router/app_routes.dart';

class NavigationHelper {
  static void handleMenuTapWithMenuAppId(BuildContext context, int menuAppId) {
    switch (menuAppId) {
      case 3:
        context.pushNamed(AppRoutes.essentialServicesName);
        break;
      case 4:
        // context.pushNamed('transport');
        break;
      case 5:
        // context.pushNamed('education');
        break;
      case 63:
        context.pushNamed(AppRoutes.automaticTellerMachineName);
        break;
      case 102:
        context.pushNamed(AppRoutes.bankName);
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tính năng đang được cập nhật')),
        );
    }
  }
}
