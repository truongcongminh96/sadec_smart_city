import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    if (width >= 1024) return 6; // desktop
    if (width >= 768) return 4; // tablet
    return 2; // phone
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
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final service in state.transportationServices)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TransportationServiceItem(item: service),
                      ),
                  ],
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
