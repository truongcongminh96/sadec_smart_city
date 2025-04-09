import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sadec_smart_city/core/router/app_routes.dart';
import 'package:sadec_smart_city/features/category_services/data/models/category_service_model.dart';
import 'package:sadec_smart_city/features/home/data/models/menu_item_model.dart';

class NavigationHelper {
  static void handleMenuTap(BuildContext context, MenuItemModel item) {
    context.pushNamed(AppRoutes.categoryServicesName, extra: item);
  }

  static void handleListDetailCategoryTap(
    BuildContext context,
    CategoryServiceModel categoryService,
  ) {
    context.pushNamed(AppRoutes.listDetailCategoryName, extra: categoryService);
  }

  static void handleDetailTapWithTableIdAnDetailId(
    BuildContext context, {
    required int tableId,
    required int detailId,
  }) {
    context.pushNamed(
      AppRoutes.detailInformationName,
      extra: {'tableId': tableId, 'detailId': detailId},
    );
  }
}
