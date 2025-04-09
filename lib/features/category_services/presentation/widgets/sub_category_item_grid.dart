import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/category_services/data/repositories/category_service_repository.dart';
import 'package:sadec_smart_city/features/category_services/logic/sub_category/sub_category_service_cubit.dart';
import 'package:sadec_smart_city/features/category_services/presentation/widgets/animated_service_item.dart';

class SubCategoryItemGrid extends StatelessWidget {
  const SubCategoryItemGrid({super.key, required this.menuAppId});

  final int menuAppId;

  int _getCrossAxisCount(double width) {
    if (width >= 1200) return 6;
    if (width >= 800) return 4;
    if (width >= 600) return 3;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create:
          (_) =>
              SubCategoryServiceCubit(getIt<CategoryServiceRepository>())
                ..loadSubCategoryServices(menuAppId),

      child: BlocBuilder<SubCategoryServiceCubit, SubCategoryServiceState>(
        builder: (context, state) {
          if (state is SubCategoryServiceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SubCategoryServiceLoaded) {
            final crossAxisCount = _getCrossAxisCount(width);

            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(6),
              child: GridView.builder(
                itemCount: state.allOtherEssentialServices.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 80,
                ),
                itemBuilder: (context, index) {
                  final service = state.allOtherEssentialServices[index];
                  return AnimatedServiceItem(service: service);
                },
              ),
            );
          } else if (state is SubCategoryServiceError) {
            return Center(child: Text("Lỗi: ${state.message}"));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
