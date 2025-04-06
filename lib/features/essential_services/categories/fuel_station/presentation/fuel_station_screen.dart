import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/essential_services/categories/fuel_station/data/repositories/fuel_station_repository.dart';
import 'package:sadec_smart_city/features/essential_services/categories/fuel_station/logic/fuel_station_cubit.dart';
import 'package:sadec_smart_city/features/essential_services/categories/fuel_station/presentation/widgets/fuel_station_card.dart';
import 'package:sadec_smart_city/features/essential_services/categories/fuel_station/presentation/widgets/fuel_station_search_bar.dart';

class FuelStationScreen extends StatefulWidget {
  const FuelStationScreen({super.key, required this.menuAppId});

  final int menuAppId;

  @override
  State<FuelStationScreen> createState() => _FuelStationScreenState();
}

class _FuelStationScreenState extends State<FuelStationScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              FuelStationCubit(getIt<FuelStationRepository>())
                ..loadFuelStations(widget.menuAppId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Danh sách trạm xăng'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Builder(
              builder:
                  (context) =>
                      FuelStationSearchBar(controller: _searchController),
            ),
          ),
        ),
        body: BlocBuilder<FuelStationCubit, FuelStationState>(
          builder: (context, state) {
            if (state is FuelStationLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is FuelStationLoaded) {
              final fuelStations = state.fuelStations;
              if (fuelStations.isEmpty) {
                return const Center(child: Text("Không tìm thấy trạm xăng."));
              }
              return AnimationLimiter(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: fuelStations.length,
                  itemBuilder: (context, index) {
                    final fuelStation = fuelStations[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: FuelStationCard(fuelStation: fuelStation),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is FuelStationError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
