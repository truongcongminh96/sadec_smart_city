import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/transportation_services/logic/transportation_services_cubit.dart';
import 'package:sadec_smart_city/features/transportation_services/presentation/widgets/transportation_service_item.dart';

class TransportationServicesScreen extends StatelessWidget {
  const TransportationServicesScreen({super.key, required this.menuAppId});

  final int menuAppId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              TransportationServicesCubit(getIt())
                ..fetchTransportationServices(menuAppId),
      child: const TransportationServicesView(),
    );
  }
}

class TransportationServicesView extends StatelessWidget {
  const TransportationServicesView({super.key});

  int _calculateCrossAxisCount(double width) {
    if (width >= 1200) return 6;
    if (width >= 800) return 4;
    if (width >= 600) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _calculateCrossAxisCount(screenWidth);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giao thông di chuyển'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<
          TransportationServicesCubit,
          TransportationServicesState
        >(
          builder: (context, state) {
            if (state is TransportationServicesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TransportationServicesLoaded) {
              final services = state.transportationServices;

              return AnimationLimiter(
                child: GridView.builder(
                  itemCount: services.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 80,
                  ),
                  itemBuilder: (context, index) {
                    final item = services[index];
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: crossAxisCount,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50,
                        child: FadeInAnimation(
                          child: TransportationServiceItem(item: item),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is TransportationServicesError) {
              return Center(child: Text("Lỗi: ${state.message}"));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
