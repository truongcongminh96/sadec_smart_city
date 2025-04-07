import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/logic/travel_and_tourism_cubit.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/presentation/widgets/matcha_theme_wrapper.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/presentation/widgets/travel_and_tourism_header.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/presentation/widgets/travel_and_tourism_item.dart';

class TravelAndTourismScreen extends StatelessWidget {
  const TravelAndTourismScreen({super.key, required this.menuAppId});

  final int menuAppId;

  @override
  Widget build(BuildContext context) {
    return MatchaThemeWrapper(
      child: BlocProvider(
        create:
            (_) =>
                TravelAndTourismCubit(getIt())
                  ..fetchTravelAndTourism(menuAppId),
        child: const TravelAndTourismView(),
      ),
    );
  }
}

class TravelAndTourismView extends StatelessWidget {
  const TravelAndTourismView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TravelAndTourismHeader(),
        body: SafeArea(
          child: BlocBuilder<TravelAndTourismCubit, TravelAndTourismState>(
            builder: (context, state) {
              if (state is TravelAndTourismLoaded) {
                final items = state.travelAndTourism;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;

                    int crossAxisCount = 1;
                    if (width >= 1024) {
                      crossAxisCount = 4;
                    } else if (width >= 700) {
                      crossAxisCount = 2;
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 200,
                      ),
                      itemCount: items.length,
                      itemBuilder:
                          (_, index) =>
                              TravelAndTourismItem(item: items[index]),
                    );
                  },
                );
              } else if (state is TravelAndTourismLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TravelAndTourismError) {
                return Center(child: Text("Lỗi: ${state.message}"));
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
