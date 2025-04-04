import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/essential_services/logic/essential_services_cubit.dart';
import 'package:sadec_smart_city/features/essential_services/presentation/widgets/essential_service_grid.dart';
import 'package:sadec_smart_city/features/essential_services/presentation/widgets/other_service_grid.dart';

class EssentialServicesScreen extends StatelessWidget {
  const EssentialServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EssentialServicesCubit(getIt())..fetchEssentialServices(),
      child: const _EssentialServicesView(),
    );
  }
}

class _EssentialServicesView extends StatelessWidget {
  const _EssentialServicesView();

  int _calculateCrossAxisCount(double width) {
    if (width >= 1024) return 6; // desktop
    if (width >= 768) return 4; // tablet
    return 2; // phone
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _calculateCrossAxisCount(screenWidth);

    return Scaffold(
      appBar: AppBar(title: const Text('Dịch vụ thiết yếu'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<EssentialServicesCubit, EssentialServicesState>(
          builder: (context, state) {
            if (state is EssentialServicesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EssentialServicesLoaded) {
              final cubit = context.read<EssentialServicesCubit>();
              final mainItems =
                  cubit.mainServices.where((e) => e.hasSubmenu == 0).toList();
              final submenuItems =
                  cubit.mainServices.where((e) => e.hasSubmenu == 1).toList();

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EssentialServiceGrid(
                      services: mainItems,
                      crossAxisCount: crossAxisCount,
                      onTap: (item) {
                        // handle tap here
                      },
                    ),
                    const SizedBox(height: 24),
                    for (final item in submenuItems)
                      OtherServiceGrid(item: item),
                  ],
                ),
              );
            } else if (state is EssentialServicesError) {
              return Center(child: Text("Lỗi: ${state.message}"));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
