import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/category_services/logic/category_service_cubit.dart';
import 'package:sadec_smart_city/features/category_services/presentation/widgets/category_service_grid.dart';
import 'package:sadec_smart_city/features/category_services/presentation/widgets/other_category_service_grid.dart';
import 'package:sadec_smart_city/features/home/data/models/menu_item_model.dart';

class CategoryServiceScreen extends StatelessWidget {
  const CategoryServiceScreen({super.key, required this.menuItem});

  final MenuItemModel menuItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              CategoryServiceCubit(getIt())
                ..fetchEssentialServices(menuItem.menuAppId),
      child: _CategoryServiceView(menuItem: menuItem),
    );
  }
}

class _CategoryServiceView extends StatelessWidget {
  const _CategoryServiceView({required this.menuItem});

  final MenuItemModel menuItem;

  int _calculateCrossAxisCount(double width) {
    if (width >= 1024) return 6; // desktop
    if (width >= 768) return 4; // tablet
    return 2; // phone
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _calculateCrossAxisCount(screenWidth);

    return BlocBuilder<CategoryServiceCubit, CategoryServiceState>(
      builder: (context, state) {
        if (state is CategoryServiceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryServiceLoaded) {
          final cubit = context.read<CategoryServiceCubit>();
          final mainItems =
              cubit.mainServices.where((e) => e.hasSubmenu == 0).toList();
          final hasSubmenuItems =
              cubit.mainServices.where((e) => e.hasSubmenu == 1).toList();

          return Scaffold(
            appBar: AppBar(title: Text(menuItem.ten), centerTitle: true),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryServiceGrid(
                      services: mainItems,
                      crossAxisCount: crossAxisCount,
                    ),
                    const SizedBox(height: 24),
                    for (final hasSubmenuItem in hasSubmenuItems)
                      OtherCategoryServiceGrid(item: hasSubmenuItem),
                  ],
                ),
              ),
            ),
          );
        } else if (state is CategoryServiceError) {
          return Center(child: Text("Lỗi: ${state.message}"));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
