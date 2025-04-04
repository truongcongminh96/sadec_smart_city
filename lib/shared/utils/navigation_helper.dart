import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sadec_smart_city/core/router/app_routes.dart';
import 'package:sadec_smart_city/features/home/data/models/menu_item_model.dart';

class NavigationHelper {
  static void handleMenuTap(BuildContext context, MenuItemModel item) {
    switch (item.menuAppId) {
      case 3:
        context.pushNamed(AppRoutes.essentialServicesName);
        break;
      case 4:
        // context.pushNamed('transport');
        break;
      case 5:
        // context.pushNamed('education');
        break;
      default:
        if (item.link.isNotEmpty) {
          context.push('/webview?url=${Uri.encodeComponent(item.link)}');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tính năng đang được cập nhật')),
          );
        }
    }
  }
}
